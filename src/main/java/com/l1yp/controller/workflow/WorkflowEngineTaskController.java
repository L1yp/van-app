package com.l1yp.controller.workflow;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.service.workflow.engine.impl.WorkflowEngineTaskServiceImpl;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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


}
