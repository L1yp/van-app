package com.l1yp.controller.modeling;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionTypeUpdateParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueAddParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueFindParam;
import com.l1yp.model.param.modeling.option.ModelingOptionValueUpdateParam;
import com.l1yp.model.view.modeling.ModelingOptionTypeView;
import com.l1yp.model.view.modeling.ModelingOptionValueView;
import com.l1yp.service.modeling.impl.ModelingOptionTypeServiceImpl;
import com.l1yp.service.modeling.impl.ModelingOptionValueServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


@RestController
@RequestMapping("/modeling/option")
@SaCheckLogin
public class ModelingOptionController {

    @Value("${app.mode}")
    private String mode;

    @Resource
    ModelingOptionTypeServiceImpl workflowOptionTypeService;

    @Resource
    ModelingOptionValueServiceImpl workflowOptionValueService;

    @GetMapping("/type/find")
    public ResultData<List<ModelingOptionTypeView>> findTypes(ModelingOptionTypeFindParam param) {
        return ResultData.ok(workflowOptionTypeService.findTypes(param));
    }

    @SaCheckLogin
    @PostMapping("/type/add")
    public ResultData<Void> addType(@Validated @RequestBody ModelingOptionTypeAddParam param) {
        workflowOptionTypeService.addType(param);
        return ResultData.OK;
    }


    @SaCheckLogin
    @PostMapping("/type/update")
    public ResultData<Void> updateType(@Validated @RequestBody ModelingOptionTypeUpdateParam param) {
        workflowOptionTypeService.updateType(param);
        return ResultData.OK;
    }

    @DeleteMapping("/type/{id}")
    public ResultData<Void> deleteType(@PathVariable("id") String typeId) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        workflowOptionTypeService.deleteType(typeId);
        return ResultData.OK;
    }

    @GetMapping("/value/find")
    public ResultData<List<ModelingOptionValueView>> findValues(ModelingOptionValueFindParam param) {
        return ResultData.ok(workflowOptionValueService.findValues(param));
    }

    @SaCheckLogin
    @PostMapping("/value/add")
    public ResultData<Void> addOptionValue(@Validated @RequestBody ModelingOptionValueAddParam param) {
        workflowOptionValueService.addValue(param);
        return ResultData.OK;
    }

    @SaCheckLogin
    @PostMapping("/value/update")
    public ResultData<Void> updateOptionValue(@Validated @RequestBody ModelingOptionValueUpdateParam param) {
        workflowOptionValueService.updateValue(param);
        return ResultData.OK;
    }

    @DeleteMapping("/value/{id}")
    public ResultData<Void> deleteOptionValue(@PathVariable("id") String valueId) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        workflowOptionValueService.deleteOptionValue(valueId);
        return ResultData.OK;
    }

    @PutMapping("/value/reset/{id}")
    public ResultData<Void> resetOptionValue(@PathVariable("id") String id) {
        workflowOptionValueService.resetOptionValue(id);
        return ResultData.OK;
    }

}
