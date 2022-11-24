package com.l1yp.service.workflow.engine.impl;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.instance.WorkflowInstanceQueryParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.system.UserView;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceCreateResult;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceDetailsResult;
import com.l1yp.service.FormService;
import com.l1yp.service.modeling.impl.ModelingEntityServiceImpl;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import com.l1yp.service.modeling.impl.ModelingPageServiceImpl;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeVerServiceImpl;
import com.l1yp.service.workflow.engine.IWorkflowInstanceService;
import com.l1yp.util.NumberUtil;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.bpmn.model.UserTask;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
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
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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


    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public WorkflowInstanceCreateResult startWorkflowInstance(WorkflowEngineInstanceCreateParam param) {
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(param.getMkey());
        if (workflowType == null) {
            throw new VanException(400, "标识有误，不存在此流程");
        }
        formService.createInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getData());
        String id = (String) param.getData().get("id");
        String name = (String) param.getData().get("name");

        ProcessInstance processInstance = runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(workflowType.getProcessDefinitionId())
                .name(name)
                .transientVariables(param.getData())
                .businessKey(id)
                .start();
        String processInstanceId = processInstance.getProcessInstanceId();
        formService.updateProcessInstanceId(param.getMkey(), id, processInstanceId);

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

        List<Task> taskList = taskService.createTaskQuery().processInstanceId(param.getInstanceId()).list();
        if (taskList != null && taskList.size() > 1) {
            log.warn("getInstanceInfo({}, {}): taskList: {}", param.getMkey(), param.getInstanceId(),
                    taskList.stream().map(TaskInfo::getId).collect(Collectors.joining(",")));
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

        List<UserView> userList = userService.listUserViewByIdList(userIds);
        Map<String, UserView> userMap = userList.stream().collect(Collectors.toMap(UserView::getId, it -> it));
        result.setUserMap(userMap);



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


        boolean hasTask = !CollectionUtils.isEmpty(taskList);
        if (hasTask) {
            Task task = taskList.get(0);
            String taskDefinitionKey = task.getTaskDefinitionKey();
            UserTask userTask = (UserTask) bpmnModel.getFlowElement(taskDefinitionKey);
            String formKey = userTask.getFormKey();
            ModelingPageView pageInfo = modelingPageService.getPageById(formKey);
            if (pageInfo == null) {
                throw new VanException(500, "当前userTask的formKey未绑定有效界面");
            }
            result.setPageInfo(pageInfo);

            LinkedHashMap<String, ModelingPageView> outcomes = new LinkedHashMap<>();
            List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
            outgoingFlows.sort((a, b) -> {
                String aOrder = a.getAttributeValue("flowable", "order");
                String bOrder = b.getAttributeValue("flowable", "order");
                return Integer.compare(Integer.parseInt(aOrder), Integer.parseInt(bOrder));
            });
            for (SequenceFlow outgoingFlow : outgoingFlows) {
                String outcomeFormKey = outgoingFlow.getAttributeValue("flowable", "formKey");
                if (outcomeFormKey != null) {
                    pageInfo = modelingPageService.getPageById(outcomeFormKey);
                    outcomes.put(outgoingFlow.getName(), pageInfo);
                }
            }

            result.setOutcomes(outcomes);

        }


        return result;

    }

}
