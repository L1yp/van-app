package com.l1yp.service.workflow.engine.impl;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.service.FormService;
import com.l1yp.service.workflow.engine.IWorkflowInstanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WorkflowInstanceServiceImpl implements IWorkflowInstanceService {

    @Resource
    FormService formService;

    @Override
    public void startWorkflowInstance(WorkflowEngineInstanceCreateParam param) {

        formService.createInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getFormData());
        String id = (String) param.getFormData().get("id");



    }


}
