package com.l1yp.controller.workflow;

import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.model.param.workflow.WorkflowTypeDefAddParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefPageParam;
import com.l1yp.model.param.workflow.WorkflowTypeDefUpdateParam;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Validated
@RestController
@RequestMapping("/workflow/type/def")
public class WorkflowTypeDefController {

    @Value("${app.mode}")
    private String mode;

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    @GetMapping("{id}")
    public ResultData<WorkflowTypeDefView> findById(@PathVariable("id") String id){
        WorkflowTypeDef workflowTypeDef = workflowTypeDefService.getById(id);
        return ResultData.ok(workflowTypeDef.toView());
    }
    @GetMapping("/page")
    public ResultData<PageData<WorkflowTypeDefView>> pageWfTypeDef(WorkflowTypeDefPageParam param) {
        return ResultData.ok(workflowTypeDefService.pageWfTypeDef(param));
    }

    @PostMapping("/add")
    public ResultData<Void> add(@RequestBody @Validated WorkflowTypeDefAddParam param) {
        workflowTypeDefService.add(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> update(@RequestBody @Validated WorkflowTypeDefUpdateParam param) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        workflowTypeDefService.update(param);
        return ResultData.OK;
    }
    
}
