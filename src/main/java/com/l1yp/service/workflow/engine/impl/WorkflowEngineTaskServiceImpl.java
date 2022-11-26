package com.l1yp.service.workflow.engine.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.exception.VanException;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage.CommentType;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskCommentAddParam;
import com.l1yp.service.FormService;
import com.l1yp.service.workflow.engine.IWorkflowEngineTaskService;
import com.l1yp.util.JsonTool;
import com.l1yp.util.RequestUtils;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class WorkflowEngineTaskServiceImpl implements IWorkflowEngineTaskService {

    @Resource
    TaskService taskService;

    @Resource
    FormService formService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void completeTask(WorkflowEngineTaskCompleteParam param) {
        String userId = RequestUtils.getLoginUserId();
        try {
            Authentication.setAuthenticatedUserId(userId);
            Task task = taskService.createTaskQuery().taskId(param.getTaskId()).taskAssignee(userId).singleResult();
            if (task == null) {
                throw new VanException(400, "任务ID有误");
            }

            var message = new TaskCommentMessage();
            message.setType(CommentType.complete);
            message.setOutcome(param.getOutcome());
            message.setComment(param.getComment());
            String strMessage = JsonTool.toJson(message);

            if (StringUtils.isNotBlank(param.getComment())) {
                taskService.addComment(param.getTaskId(), task.getProcessInstanceId(), CommentType.complete.toString(), strMessage);
            } else {
                taskService.addComment(param.getTaskId(), task.getProcessInstanceId(), CommentType.complete.toString(), strMessage);
            }

            taskService.createTaskCompletionBuilder()
                    .taskId(param.getTaskId())
                    .transientVariables(param.getData())
                    .transientVariable("outcome", param.getOutcome())
                    .complete();

            formService.updateInstance(ModelingModule.WORKFLOW, param.getMkey(), param.getData());
        } finally {
            Authentication.setAuthenticatedUserId(null);
        }


        // update form instance
    }


    public void addComment(WorkflowTaskCommentAddParam param) {
        String userId = RequestUtils.getLoginUserId();

        try {
            Authentication.setAuthenticatedUserId(userId);

            var message = new TaskCommentMessage();
            message.setType(CommentType.comment);
            message.setComment(param.getComment());
            String strMessage = JsonTool.toJson(message);
            taskService.addComment(param.getTaskId(), param.getProcessInstanceId(), CommentType.comment.toString(), strMessage);
        } finally {
            Authentication.setAuthenticatedUserId(null);
        }
    }

}
