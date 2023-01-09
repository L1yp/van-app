package com.l1yp.flowable.multi.instance;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.l1yp.conf.constants.process.WorkflowConstant;
import com.l1yp.mapper.workflow.engine.WorkflowHiCommentMapper;
import com.l1yp.model.db.workflow.engine.TaskComment;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage.CommentType;
import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.api.query.Query.NullHandlingOnOrder;
import org.flowable.common.engine.api.query.QueryProperty;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.ActivityInstanceQueryProperty;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.runtime.ActivityInstance;
import org.flowable.engine.task.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Component("completionStrategy")
public class CompletionStrategy {

    @Resource
    TaskService taskService;

    @Resource
    RuntimeService runtimeService;

    @Resource
    WorkflowHiCommentMapper workflowHiCommentMapper;

    static final Logger log = LoggerFactory.getLogger(CompletionStrategy.class);

    enum CompletionRule {
        dynamic, any, all,
        ;
    }

    public boolean isCompletion(DelegateExecution execution) {

        String processInstanceId = execution.getProcessInstanceId();

        String currentElemId = execution.getCurrentFlowElement().getId();

        UserTask userTask = (UserTask) execution.getCurrentFlowElement();
        List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
        Map<String, SequenceFlow> flowMap = outgoingFlows.stream().collect(Collectors.toMap(FlowElement::getName, it -> it));
        Map<String, CompletionRule> ruleMap = new HashMap<>();
        for (SequenceFlow outgoingFlow : outgoingFlows) {
            String completionRule = outgoingFlow.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "completionRule");
            if (StringUtils.isBlank(completionRule)) {
                continue;
            }
            CompletionRule rule = CompletionRule.valueOf(completionRule);
            ruleMap.put(outgoingFlow.getName(), rule);
        }

        String outcome = (String) execution.getTransientVariable(WorkflowConstant.OUTCOME);
        if (StringUtils.isBlank(outcome)) {
            log.warn("isCompletion: outcome is blank");
            return false;
        }
        CompletionRule rule = ruleMap.get(outcome);
        if (rule == CompletionRule.any) {
            return true;
        } else if (rule == CompletionRule.all) {
            // 获取当前节点的完成情况
            List<ActivityInstance> list = runtimeService.createActivityInstanceQuery()
                    .processInstanceId(processInstanceId)
                    .activityId(currentElemId)
                    .orderBy(ActivityInstanceQueryProperty.END, NullHandlingOnOrder.NULLS_LAST)
                    .asc().list();
            Number nrOfInstances = (Number) execution.getVariable("nrOfInstances");

            list.sort(Comparator.comparing(ActivityInstance::getStartTime));

            list = list.subList(list.size() - nrOfInstances.intValue(), list.size());

            // 任务全部完成
            var finished = list.stream().allMatch(activityInstance -> activityInstance.getEndTime() != null);
            if (finished) {
                // 查询每个任务的出口
                List<String> taskIdList = list.stream().map(ActivityInstance::getTaskId).toList();
                List<TaskComment> taskComments = workflowHiCommentMapper.selectList(
                        Wrappers.<TaskComment>lambdaQuery().eq(TaskComment::getProcessInstanceId, processInstanceId)
                                .eq(TaskComment::getType, CommentType.complete).in(TaskComment::getTaskId, taskIdList));
                var matched = taskComments.stream().map(TaskComment::getMessage).map(TaskCommentMessage::getOutcome).allMatch(outcome::equals);
                if (!matched) {
                    log.error("processInstId: [{}], 会签任务全部完成, 但未匹配成功", processInstanceId);
                }
                return matched;
            }
            return false;
        } else if (rule == CompletionRule.dynamic) {
            SequenceFlow sequenceFlow = flowMap.get(outcome);
            String expression = sequenceFlow.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "completionExpression");
            ExpressionManager expressionManager = CommandContextUtil.getProcessEngineConfiguration().getExpressionManager();
            Object value = expressionManager.createExpression(expression).getValue(execution);
            if (value instanceof Boolean bFlag) {
                return bFlag;
            } else {
                throw new FlowableException(String.format("sequenceFlow[completionExpression=%s] result is not a boolean value.", expression));
            }
        } else {
            throw new FlowableException("sequenceFlow[completionRule] mismatch.");
        }
    }

}
