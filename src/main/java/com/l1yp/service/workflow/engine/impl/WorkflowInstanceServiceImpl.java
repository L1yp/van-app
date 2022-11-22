package com.l1yp.service.workflow.engine.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.exception.VanException;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.page.PageScheme;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.workflow.WorkflowTypeVerView;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceCreateResult;
import com.l1yp.service.FormService;
import com.l1yp.service.modeling.impl.ModelingEntityServiceImpl;
import com.l1yp.service.modeling.impl.ModelingPageServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeVerServiceImpl;
import com.l1yp.service.workflow.engine.IWorkflowInstanceService;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WorkflowInstanceServiceImpl implements IWorkflowInstanceService {

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
    ModelingPageServiceImpl modelingPageService;

    @Override
    public WorkflowInstanceCreateResult startWorkflowInstance(WorkflowEngineInstanceCreateParam param) {
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(param.getMkey());
        if (workflowType == null) {
            throw new VanException(400, "标识有误，不存在此流程");
        }
        formService.createInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getFormData());
        String id = (String) param.getFormData().get("id");
        String name = (String) param.getFormData().get("name");

        ProcessInstance processInstance = runtimeService.createProcessInstanceBuilder()
                .processDefinitionId(workflowType.getProcessDefinitionId())
                .name(name)
                .transientVariables(param.getFormData())
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
}
