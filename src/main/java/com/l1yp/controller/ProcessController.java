package com.l1yp.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.bpmn.*;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.process.ProcessTaskCompleteParam;
import com.l1yp.model.param.process.TaskClaimParam;
import com.l1yp.model.param.process.view.ProcessTodoTaskView;
import com.l1yp.model.view.ProcessTaskView;
import com.l1yp.service.ProcessService;
import org.flowable.engine.TaskService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@SaCheckLogin
@RestController
@RequestMapping("/process")
@Validated
public class ProcessController {

    @Resource
    ProcessService processService;


    /**
     * 启动流程
     */
    @PostMapping("/create")
    public ResultData<Void> createProcess(@RequestBody ProcessCreateParam param) {
        return processService.createProcess(param);
    }

    /**
     * 我的待办任务列表
     */
    @GetMapping("/task/assignee/list")
    public ResultData<List<ProcessTaskView>> listAssigneeTask() {
        return processService.listAssigneeTask();
    }

    /**
     * 我的待认领任务列表
     */
    @GetMapping("/task/candidate/list")
    public ResultData<List<ProcessTaskView>> listCandidateTask() {
        return processService.listCandidateTask();
    }

    /**
     * 认领任务
     * @return
     */
    @PostMapping("/task/claim")
    public ResultData<Void> claimTask(@RequestBody TaskClaimParam param) {
        return processService.claimTask(param.getTaskId());
    }

    /**
     * 撤回认领的任务
     */
    @PostMapping("/task/unclaim")
    public ResultData<Void> unclaimTask(@RequestBody TaskClaimParam param) {
        return processService.unclaimTask(param.getTaskId());
    }

    /**
     * 我的待办
     */
    @GetMapping("/task/todo/list")
    public ResultData<List<ProcessTodoTaskView>> listProcessTodoTask() {
        return processService.listTodoTasks();
    }

    /**
     * 我的历史流程
     */
    @GetMapping("/task/history/list")
    public ResultData<List<ProcessTodoTaskView>> listMyHistoryTasks() {
        return processService.listMyHistoryTasks();
    }

    @GetMapping("/instance/list")
    public ResultData<List<Map<String, Object>>> processListByKey(@RequestParam(name = "processKey") String processKey) {
        return processService.processListByKey(processKey);
    }

    @GetMapping("/instance/info")
    public ResultData<Map<String, Object>> processInfoByKey(@RequestParam(name = "processKey") @NotBlank String processKey,
                                                                  @RequestParam(name = "id") @NotNull @Min(1) Long id) {
        return processService.processInfo(processKey, id);
    }

    @GetMapping("/instance/history")
    public ResultData<List<HistoricActivityInstanceView>> processHistoryByKey(
            @RequestParam(name = "processInstanceId") @NotBlank String processInstanceId) {
        return processService.readProcessHistory(processInstanceId);
    }

    @PostMapping("/task/complete")
    public ResultData<Void> completeTask(@RequestBody ProcessTaskCompleteParam param) {
        return processService.completeTask(param);
    }

}
