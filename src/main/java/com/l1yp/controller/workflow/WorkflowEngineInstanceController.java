package com.l1yp.controller.workflow;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.service.workflow.engine.impl.WorkflowEngineTaskServiceImpl;
import com.l1yp.service.workflow.engine.impl.WorkflowInstanceServiceImpl;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/workflow/engine/instance")
public class WorkflowEngineInstanceController {

    @Resource
    WorkflowInstanceServiceImpl workflowEngineService;

    @PostMapping("/start")
    public ResultData<Void> completeTask(@RequestBody WorkflowEngineInstanceCreateParam param) {
        workflowEngineService.startWorkflowInstance(param);
        return ResultData.OK;
    }


}
