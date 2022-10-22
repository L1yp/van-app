package com.l1yp.controller.workflow;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.WorkflowFieldDefAddParam;
import com.l1yp.model.param.workflow.WorkflowFieldDefUpdateParam;
import com.l1yp.model.param.workflow.WorkflowFieldFindParam;
import com.l1yp.model.param.workflow.WorkflowFieldRefParam;
import com.l1yp.model.view.workflow.WorkflowFieldDefView;
import com.l1yp.service.workflow.impl.WorkflowFieldDefServiceImpl;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/workflow/field")
public class WorkflowFieldController {

    @Resource
    WorkflowFieldDefServiceImpl workflowFieldDefService;

    @GetMapping("/find")
    public ResultData<List<WorkflowFieldDefView>> findFields(WorkflowFieldFindParam param) {
        return ResultData.ok(workflowFieldDefService.findFields(param));
    }

    /**
     * 新增字段
     */
    @PostMapping("/add")
    public ResultData<Void> addField(@Validated @RequestBody WorkflowFieldDefAddParam param) {
        workflowFieldDefService.addField(param);
        return ResultData.OK;
    }

    /**
     * 更新字段
     */
    @PostMapping("/update")
    public ResultData<Void> updateField(@Validated @RequestBody WorkflowFieldDefUpdateParam param) {
        workflowFieldDefService.updateField(param);
        return ResultData.OK;
    }

    /**
     * 引用全局字段
     */
    @PostMapping("/ref")
    public ResultData<Void> refField(@Validated @RequestBody WorkflowFieldRefParam param) {
        workflowFieldDefService.refGlobalField(param);
        return ResultData.OK;
    }

    /**
     * 取消引用全局字段
     */
    @PostMapping("/unref")
    public ResultData<Void> unrefField(@Validated @RequestBody WorkflowFieldRefParam param) {
        workflowFieldDefService.unrefGlobalField(param);
        return ResultData.OK;
    }

}
