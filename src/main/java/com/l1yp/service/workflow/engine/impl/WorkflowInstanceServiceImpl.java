package com.l1yp.service.workflow.engine.impl;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.engine.WorkflowHiCommentMapper;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.workflow.engine.TaskComment;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage.CommentType;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.instance.WorkflowInstanceQueryParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.model.view.workflow.instance.WorkflowActivityInfo;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceCreateResult;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceDetailsResult;
import com.l1yp.model.view.workflow.instance.WorkflowOutcomeInfo;
import com.l1yp.service.FormService;
import com.l1yp.service.modeling.impl.ModelingEntityServiceImpl;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import com.l1yp.service.modeling.impl.ModelingPageServiceImpl;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeVerServiceImpl;
import com.l1yp.service.workflow.engine.IWorkflowInstanceService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.NumberUtil;
import com.l1yp.util.RequestUtils;
import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.api.query.Query.NullHandlingOnOrder;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.impl.HistoricActivityInstanceQueryProperty;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class WorkflowInstanceServiceImpl implements IWorkflowInstanceService {

    private static final Logger log = LoggerFactory.getLogger(WorkflowInstanceServiceImpl.class);

    @Resource
    FormService formService;

    @Resource
    RuntimeService runtimeService;

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    @Resource
    WorkflowTypeVerServiceImpl workflowTypeVerService;

    @Resource
    ModelingEntityServiceImpl modelingEntityService;

    @Resource
    RepositoryService repositoryService;

    @Resource
    TaskService taskService;

    @Resource
    HistoryService historyService;

    @Resource
    ModelingPageServiceImpl modelingPageService;

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Resource
    UserServiceImpl userService;

    @Resource
    WorkflowHiCommentMapper workflowHiCommentMapper;

    public static final String DELETE_REASON_END = "MI_END";


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public WorkflowInstanceCreateResult startWorkflowInstance(WorkflowEngineInstanceCreateParam param) {
        String loginUserId = RequestUtils.getLoginUserId();
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(param.getMkey());
        if (workflowType == null) {
            throw new VanException(400, "标识有误，不存在此流程");
        }

        String processInstanceId = IdWorker.getIdStr();
        param.getData().put("process_instance_id", processInstanceId);

        formService.createInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getData());
        String id = (String) param.getData().get("id");
        String name = (String) param.getData().get("name");

        try {
            Authentication.setAuthenticatedUserId(loginUserId);
            ProcessInstance processInstance = runtimeService.createProcessInstanceBuilder()
                    .processDefinitionId(workflowType.getProcessDefinitionId())
                    .predefineProcessInstanceId(processInstanceId)
                    .name(name)
                    .transientVariables(param.getData())
                    .businessKey(id)
                    .start();
        } finally {
            Authentication.setAuthenticatedUserId(null);
        }


        var result = new WorkflowInstanceCreateResult();
        result.setId(id);
        result.setProcessInstanceId(processInstanceId);
        return result;
    }

    @Override
    public ModelingPageView getStartForm(String mkey) {
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(mkey);
        String activeVerId = workflowType.getActiveVerId();
        if (StringUtils.isBlank(activeVerId)) {
            throw new VanException(400, "请先激活一个流程版本");
        }
        WorkflowTypeVerView workflowTypeVer = workflowTypeVerService.findVer(activeVerId);
        if (workflowTypeVer == null) {
            throw new VanException(500, "系统错误：找不到激活的流程版本");
        }
        BpmnModel bpmnModel = repositoryService.getBpmnModel(workflowType.getProcessDefinitionId());

        Process process = bpmnModel.getProcessById(workflowType.getKey());
        for (FlowElement flowElement : process.getFlowElements()) {
            if (flowElement instanceof StartEvent startEvent) {
                String formKey = startEvent.getFormKey();
                if (StringUtils.isBlank(formKey)) {
                    throw new VanException(500, "请先配置启动表单");
                }
                return modelingPageService.getPageById(formKey);
            }
        }


        return null;
    }


    public WorkflowInstanceDetailsResult getInstanceInfo(WorkflowInstanceQueryParam param) {
        String loginUserId = RequestUtils.getLoginUserId();
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(param.getMkey());
        if (workflowType == null) {
            throw new VanException(400, "流程标识有误，不存在的标识");
        }

        List<ModelingField> modelFields = modelingFieldService.findModelFields(ModelingModule.WORKFLOW, param.getMkey());
        List<String> userFields = modelFields.stream().filter(it -> it.getType() == FieldType.user).map(ModelingField::getField).toList();


        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(param.getInstanceId()).singleResult();
        if (historicProcessInstance == null) {
            log.warn("getInstanceInfo({}, {}): 查询不到流程图信息", param.getMkey(), param.getInstanceId());
            throw new VanException(500, "流程引擎内不存在此流程，请联系管理员");
        }
        String processDefinitionId = historicProcessInstance.getProcessDefinitionId();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        if (bpmnModel == null) {
            log.warn("getInstanceInfo({}, {}): 查询不到流程图信息, processDefinitionId: {}", param.getMkey(), param.getInstanceId(), processDefinitionId);
            throw new VanException(500, "流程图模型不存在，请联系管理员");
        }

        List<Task> processTaskList = taskService.createTaskQuery().processInstanceId(param.getInstanceId()).list();

        long ownerTaskCount = processTaskList.stream().filter(it -> it.getAssignee().equals(loginUserId)).count();

        if (ownerTaskCount > 1) {
            log.warn("getInstanceInfo({}, {})", param.getMkey(), param.getInstanceId());
            throw new VanException(500, "此流程同时存在多个任务，请删除流程后重新配置流程图");
        }

        var result = new WorkflowInstanceDetailsResult();


        String tableName = WorkflowTypeDef.buildEntityTableName(param.getMkey());
        Map<String, Object> instanceInfo = workflowTypeDefService.getBaseMapper().getInstanceByInstanceId(tableName, param.getInstanceId());
        if (instanceInfo == null) {
            throw new VanException(400, "查询不到此流程实例表单");
        }

        // BigInteger to String
        NumberUtil.transformBigIntToString(instanceInfo);
        Set<String> userIds = new HashSet<>();
        for (String userField : userFields) {
            String val = (String) instanceInfo.get(userField);
            if (val == null) {
                continue;
            }
            if (val.contains(",")) {
                userIds.addAll(Arrays.asList(val.split(",")));
            } else {
                userIds.add(val);
            }
        }





        result.setInstanceInfo(instanceInfo);

        ProcessDefinition processDefinition = repositoryService.getProcessDefinition(processDefinitionId);
        if (processDefinition == null) {
            log.warn("getInstanceInfo({}, {}): 查询不到流程图信息, processDefinitionId: {}", param.getMkey(), param.getInstanceId(), processDefinitionId);
            throw new VanException(500, "查询流程定义失败");
        }
        String resourceName = processDefinition.getResourceName();
        String deploymentId = processDefinition.getDeploymentId();
        InputStream xmlIs = repositoryService.getResourceAsStream(deploymentId, resourceName);
        try {
            byte[] bytes = xmlIs.readAllBytes();
            String xml = new String(bytes, StandardCharsets.UTF_8);
            result.setXml(xml);
        } catch (IOException e) {
            log.error("getInstanceInfo({}, {}): 读取流程xml失败, processDefinitionId: {}", param.getMkey(), param.getInstanceId(), processDefinitionId, e);
            throw new VanException(500, "读取XML失败");
        }

        List<TaskComment> taskComments = workflowHiCommentMapper.selectList(Wrappers.<TaskComment>lambdaQuery().eq(TaskComment::getProcessInstanceId, param.getInstanceId()));

        taskComments.stream().map(TaskComment::getUserId).forEach(userIds::add);

        result.setCommentList(taskComments);

        if (ownerTaskCount == 1) {
            Task ownerTask = processTaskList.stream().filter(it -> it.getAssignee().equals(loginUserId)).findFirst().get();
            result.setTaskId(ownerTask.getId());

            UserTask userTask = (UserTask) bpmnModel.getFlowElement(ownerTask.getTaskDefinitionKey());
            List<WorkflowOutcomeInfo> outcomeInfos = new ArrayList<>();
            List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
            outgoingFlows.sort((a, b) -> {
                String aOrder = a.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "order");
                String bOrder = b.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "order");
                int iOrderA = 0, iOrderB = 0;
                if (StringUtils.isNotBlank(aOrder)) {
                    iOrderA = Integer.parseInt(aOrder);
                }
                if (StringUtils.isNotBlank(bOrder)) {
                    iOrderB = Integer.parseInt(bOrder);
                }
                return Integer.compare(iOrderA, iOrderB);
            });
            for (SequenceFlow outgoingFlow : outgoingFlows) {
                var outcomeInfo = new WorkflowOutcomeInfo();
                outcomeInfo.setName(outgoingFlow.getName());
                String outcomeFormKey = outgoingFlow.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "formKey");
                if (outcomeFormKey != null) {
                    ModelingPageView pageInfo = modelingPageService.getPageById(outcomeFormKey);
                    outcomeInfo.setPageInfo(pageInfo);
                }
                outcomeInfos.add(outcomeInfo);
            }
            result.setOutcomes(outcomeInfos);

        }


        var list = historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(param.getInstanceId())
                .orderBy(HistoricActivityInstanceQueryProperty.END, NullHandlingOnOrder.NULLS_LAST)
                .asc().list();
        list.stream().map(HistoricActivityInstance::getAssignee).filter(Objects::nonNull).forEach(userIds::add);

        var activityList = new ArrayList<WorkflowActivityInfo>();
        for (HistoricActivityInstance instance : list) {
            var activity = new WorkflowActivityInfo();
            BeanCopierUtil.copy(instance, activity);
            // FIXME: startEvent EndEvent
            activityList.add(activity);
            if (!activity.getActivityType().equals("userTask")) {
                continue;
            }
            if (DELETE_REASON_END.equals(instance.getDeleteReason())) {
                activity.setOutcome("会签结束自动删除");
            }
            List<TaskComment> commentList = taskComments.stream()
                    .filter(it -> it.getTaskId().equals(activity.getTaskId()))
                    .filter(it -> it.getMessage().getType() == CommentType.complete)
                    .toList();
            if (commentList.size() == 1) {
                TaskComment taskComment = commentList.get(0);
                activity.setOutcome(taskComment.getMessage().getOutcome());
            }

        }


        result.setActivityList(activityList);

        if (!CollectionUtils.isEmpty(activityList)) {
            String activityId = null;
            for (int i = activityList.size() - 1; i >= 0; i--) {
                var activityInfo = activityList.get(i);
                if (activityInfo.getActivityType().equals("userTask")) {
                    activityId = activityInfo.getActivityId();
                    break;
                }
            }
            if (activityId != null) {
                UserTask userTask = (UserTask) bpmnModel.getFlowElement(activityId);
                String formKey = userTask.getFormKey();
                ModelingPageView pageInfo = modelingPageService.getPageById(formKey);
                if (pageInfo == null) {
                    throw new VanException(500, "当前userTask的formKey未绑定有效界面");
                }
                result.setPageInfo(pageInfo);
            }
        }





        List<UserView> userList = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = userList.stream().collect(Collectors.toMap(UserView::getId, it -> it));
        result.setUserMap(userMap);

        return result;

    }

}
