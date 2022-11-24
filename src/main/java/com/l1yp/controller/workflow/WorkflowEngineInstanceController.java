package com.l1yp.controller.workflow;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.instance.WorkflowEngineInstanceCreateParam;
import com.l1yp.model.param.workflow.instance.WorkflowInstanceQueryParam;
import com.l1yp.model.param.workflow.task.WorkflowEngineTaskCompleteParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceCreateResult;
import com.l1yp.model.view.workflow.instance.WorkflowInstanceDetailsResult;
import com.l1yp.service.workflow.engine.impl.WorkflowEngineTaskServiceImpl;
import com.l1yp.service.workflow.engine.impl.WorkflowInstanceServiceImpl;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Validated
@RestController
@RequestMapping("/workflow/engine/instance")
public class WorkflowEngineInstanceController {

    @Resource
    WorkflowInstanceServiceImpl workflowEngineService;

    @PostMapping("/start")
    public ResultData<WorkflowInstanceCreateResult> start(@RequestBody WorkflowEngineInstanceCreateParam param) {
        return ResultData.ok(workflowEngineService.startWorkflowInstance(param));
    }

    @GetMapping("/getStartForm")
    public ResultData<ModelingPageView> getStartForm(@Validated @RequestParam String mkey) {
        return ResultData.ok(workflowEngineService.getStartForm(mkey));
    }


    @GetMapping("/info")
    public ResultData<WorkflowInstanceDetailsResult> getInstanceInfo(@Validated WorkflowInstanceQueryParam param) {
        return ResultData.ok(workflowEngineService.getInstanceInfo(param));
    }


}
