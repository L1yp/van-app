package com.l1yp.controller.workflow;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskCommentAddParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskFindParam;
import com.l1yp.model.param.workflow.task.WorkflowTaskView;
import com.l1yp.service.workflow.engine.impl.WorkflowEngineTaskServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@SaCheckLogin
@RestController
@RequestMapping("/workflow/engine/task")
public class WorkflowEngineTaskController {

    @Resource
    WorkflowEngineTaskServiceImpl workflowEngineService;

    @PostMapping("/complete")
    public ResultData<Void> completeTask(@RequestBody WorkflowEngineTaskCompleteParam param) {
        workflowEngineService.completeTask(param);
        return ResultData.OK;
    }

    @PostMapping("/comment/add")
    public ResultData<Void> addComment(@RequestBody WorkflowTaskCommentAddParam param) {
        workflowEngineService.addComment(param);
        return ResultData.OK;
    }

    @GetMapping("/todo/page")
    public ResultData<PageData<WorkflowTaskView>> listTodoTask(WorkflowTaskFindParam param) {
        return ResultData.ok(workflowEngineService.todoTasks(param));
    }

    @GetMapping("/done/page")
    public ResultData<PageData<WorkflowTaskView>> listDoneTask(WorkflowTaskFindParam param) {
        return ResultData.ok(workflowEngineService.doneTasks(param));
    }

}
