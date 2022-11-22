package com.l1yp.service.workflow.engine;

import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;

public interface IWorkflowInstanceService {

    void startWorkflowInstance(WorkflowEngineInstanceCreateParam param);


}
