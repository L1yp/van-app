package com.l1yp.service.workflow.engine.impl;

import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.service.workflow.engine.IWorkflowEngineTaskService;
import org.flowable.engine.TaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WorkflowEngineTaskServiceImpl implements IWorkflowEngineTaskService {

    @Resource
    TaskService taskService;

    @Override
    public void completeTask(WorkflowEngineTaskCompleteParam param) {

    }
}
