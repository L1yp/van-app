package com.l1yp.service.workflow.engine.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.exception.VanException;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.service.FormService;
import com.l1yp.service.workflow.engine.IWorkflowEngineTaskService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class WorkflowEngineTaskServiceImpl implements IWorkflowEngineTaskService {

    @Resource
    TaskService taskService;

    @Resource
    FormService formService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void completeTask(WorkflowEngineTaskCompleteParam param) {

        Task task = taskService.createTaskQuery().taskId(param.getTaskId()).singleResult();
        if (task == null) {
            throw new VanException(400, "任务ID有误");
        }

        if (StringUtils.isNotBlank(param.getComment())) {
            taskService.addComment(param.getTaskId(), task.getProcessInstanceId(), param.getComment());
        }

        taskService.createTaskCompletionBuilder()
                .taskId(param.getTaskId())
                .transientVariables(param.getData())
                .transientVariable("outcome", param.getOutcome())
                .complete();

        formService.updateInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getData());

        // update form instance
    }
}
