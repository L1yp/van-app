package com.l1yp.controller.workflow;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.workflow.WorkflowOptionTypeAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeUpdateParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueUpdateParam;
import com.l1yp.model.view.workflow.WorkflowOptionTypeView;
import com.l1yp.model.view.workflow.WorkflowOptionValueView;
import com.l1yp.service.workflow.impl.WorkflowOptionTypeServiceImpl;
import com.l1yp.service.workflow.impl.WorkflowOptionValueServiceImpl;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


@RestController
@RequestMapping("/workflow/option")
public class WorkflowOptionController {

    @Resource
    WorkflowOptionTypeServiceImpl workflowOptionTypeService;

    @Resource
    WorkflowOptionValueServiceImpl workflowOptionValueService;

    @GetMapping("/type/find")
    public ResultData<List<WorkflowOptionTypeView>> findTypes(WorkflowOptionTypeFindParam param) {
        return ResultData.ok(workflowOptionTypeService.findTypes(param));
    }

    @SaCheckLogin
    @PostMapping("/type/add")
    public ResultData<Void> addType(@Validated @RequestBody WorkflowOptionTypeAddParam param) {
        workflowOptionTypeService.addType(param);
        return ResultData.OK;
    }


    @SaCheckLogin
    @PostMapping("/type/update")
    public ResultData<Void> updateType(@Validated @RequestBody WorkflowOptionTypeUpdateParam param) {
        workflowOptionTypeService.updateType(param);
        return ResultData.OK;
    }

    @GetMapping("/value/find")
    public ResultData<List<WorkflowOptionValueView>> findValues(WorkflowOptionValueFindParam param) {
        return ResultData.ok(workflowOptionValueService.findValues(param));
    }

    @SaCheckLogin
    @PostMapping("/value/add")
    public ResultData<Void> addOptionValue(@Validated @RequestBody WorkflowOptionValueAddParam param) {
        workflowOptionValueService.addValue(param);
        return ResultData.OK;
    }

    @SaCheckLogin
    @PostMapping("/value/update")
    public ResultData<Void> updateOptionValue(@Validated @RequestBody WorkflowOptionValueUpdateParam param) {
        workflowOptionValueService.updateValue(param);
        return ResultData.OK;
    }

}
