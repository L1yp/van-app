package com.l1yp.service.workflow.engine.impl;

import com.l1yp.mapper.workflow.engine.WorkflowEngineTaskMapper;
import com.l1yp.model.common.PageParam;
import com.l1yp.model.db.workflow.engine.WorkflowTask;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.system.impl.UserServiceImpl;
import org.apache.commons.lang3.StringUtils;
import com.l1yp.exception.VanException;
import com.l1yp.model.common.PageData;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage;
import com.l1yp.model.db.workflow.engine.TaskCommentMessage.CommentType;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskCommentAddParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskFindParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskView;
import com.l1yp.service.FormService;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import com.l1yp.service.workflow.engine.IWorkflowEngineTaskService;
import com.l1yp.util.JsonTool;
import com.l1yp.util.RequestUtils;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.TaskService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class WorkflowEngineTaskServiceImpl implements IWorkflowEngineTaskService {

    @Resource
    TaskService taskService;

    @Resource
    FormService formService;

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    @Resource
    UserServiceImpl userService;

    @Resource
    WorkflowEngineTaskMapper workflowEngineTaskMapper;

    @Resource
    RepositoryService repositoryService;

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


    public PageData<WorkflowTaskView> todoTasks(WorkflowTaskFindParam param) {
        String loginUserId = RequestUtils.getLoginUserId();
        int count = workflowEngineTaskMapper.countTodoTasks(loginUserId, param);
        if (count == 0) {
            return PageData.empty(param);
        }

        var tasks = workflowEngineTaskMapper.listTodoTasks(loginUserId, param);
        var userIds = new HashSet<String>();

        var list = toWorkflowTaskViewList(tasks, userIds);
        return toPageData(list, count, userIds, param);
    }


    public PageData<WorkflowTaskView> doneTasks(WorkflowTaskFindParam param) {
        String loginUserId = RequestUtils.getLoginUserId();
        int count = workflowEngineTaskMapper.countDoneTasks(loginUserId, param);
        if (count == 0) {
            return PageData.empty(param);
        }

        var tasks = workflowEngineTaskMapper.listDoneTasks(loginUserId, param);
        var userIds = new HashSet<String>();
        var list = toWorkflowTaskViewList(tasks, userIds);
        return toPageData(list, count, userIds, param);

    }

    private List<WorkflowTaskView> toWorkflowTaskViewList(List<WorkflowTask> tasks, Set<String> userIds) {
        var list = new ArrayList<WorkflowTaskView>();
        for (var task : tasks) {
            var item = new WorkflowTaskView();
            item.setClaimTime(task.getClaimTime());
            item.setCreateTime(task.getCreateTime());
            item.setTaskId(task.getId());
            item.setAssignee(task.getAssignee());
            ProcessDefinition processDefinition = repositoryService.getProcessDefinition(task.getProcessDefinitionId());
            String mkey = processDefinition.getKey();
            item.setMkey(mkey);
            item.setProcessDefinitionId(task.getProcessDefinitionId());

            WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(mkey);
            item.setWorkflowType(workflowType.getName());

            item.setTaskDefKey(task.getTaskDefinitionKey());
            item.setTaskName(task.getName());
            item.setProcessInstanceId(task.getProcessInstanceId());

            if (StringUtils.isNotBlank(task.getStartUserId())) {
                userIds.add(task.getStartUserId());
            }
            if (StringUtils.isNotBlank(task.getAssignee())) {
                userIds.add(task.getAssignee());
            }

            item.setProcessInstanceName(task.getProcessInstanceName());
            item.setStartTime(task.getStartTime());
            item.setStartUserId(task.getStartUserId());

            list.add(item);
        }
        return list;
    }

    private PageData<WorkflowTaskView> toPageData(List<WorkflowTaskView> data, int total, Set<String> userIds, PageParam param) {
        var pageData = new PageData<WorkflowTaskView>(param);
        pageData.setTotal(total);
        pageData.setData(data);
        var map = new HashMap<String, Object>();
        if (!userIds.isEmpty()) {
            List<UserView> userViews = userService.listUserViewByIdList(userIds);
            map.put("user", userViews);
        }
        pageData.setAdditional(map);
        return pageData;
    }


}
