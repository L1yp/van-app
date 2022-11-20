package com.l1yp.service.workflow.engine;

import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;

public interface IWorkflowEngineTaskService {

    void completeTask(WorkflowEngineTaskCompleteParam param);


}
