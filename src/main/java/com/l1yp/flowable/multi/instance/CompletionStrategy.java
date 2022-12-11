package com.l1yp.flowable.multi.instance;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.l1yp.conf.constants.process.WorkflowConstant;
import com.l1yp.mapper.workflow.engine.WorkflowHiCommentMapper;
import com.l1yp.model.db.workflow.engine.TaskComment;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage.CommentType;
import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.api.FlowableException;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.TaskService;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.task.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
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
    WorkflowHiCommentMapper workflowHiCommentMapper;

    static final Logger log = LoggerFactory.getLogger(CompletionStrategy.class);

    enum CompletionRule {
        dynamic, any, all,
        ;
    }

    public boolean isCompletion(DelegateExecution execution) {

        String processInstanceId = execution.getProcessInstanceId();


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
            List<TaskComment> taskComments = workflowHiCommentMapper.selectList(Wrappers.<TaskComment>lambdaQuery()
                    .eq(TaskComment::getProcessInstanceId, processInstanceId)
                    .eq(TaskComment::getType, CommentType.complete));
            long count = taskComments.stream().filter(Objects::nonNull).filter(it -> it.getMessage().getOutcome().equals(outcome)).count();
            int nrOfInstances = (int) execution.getVariable("nrOfInstances");
//            int nrOfCompletedInstances = (int) execution.getVariable("nrOfCompletedInstances"); // FIXME: 多个出口会有问题

            return nrOfInstances == count;
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
