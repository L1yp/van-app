package com.l1yp.controller.modeling;


import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.entity.ModelingEntityAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceDeleteParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityInstanceUpdateParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityUpdateParam;
import com.l1yp.model.view.modeling.ModelingEntityView;
import com.l1yp.service.modeling.impl.ModelingEntityServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.Map;

@RestController
@RequestMapping("/modeling/entity")
@SaCheckLogin
public class ModelingEntityController {

    @Resource
    ModelingEntityServiceImpl modelingEntityService;

    @Value("${app.mode}")
    private String mode;

    @GetMapping("/find/{id}")
    public ResultData<ModelingEntityView> findEntity(@Validated @PathVariable("id") String id) {
        return ResultData.ok(modelingEntityService.findEntity(id));
    }


    @GetMapping("/search")
    public ResultData<PageData<ModelingEntityView>> searchEntity(@Validated ModelingEntityFindParam param) {
        return ResultData.ok(modelingEntityService.searchEntity(param));
    }

    @PostMapping("/add")
    public ResultData<Void> addEntity(@Validated @RequestBody ModelingEntityAddParam param) {
        modelingEntityService.addEntity(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> updateEntity(@Validated @RequestBody ModelingEntityUpdateParam param) {
        modelingEntityService.updateEntity(param);
        return ResultData.OK;
    }

    @DeleteMapping("{id}")
    public ResultData<Void> deleteEntity(@Validated @NotBlank @PathVariable("id") String id) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        modelingEntityService.deleteEntity(id);
        return ResultData.OK;
    }

    // instance

    @GetMapping("/instance")
    public ResultData<Map<String, Object>> getInstance(ModelingEntityInstanceFindParam param) {
        return ResultData.ok(modelingEntityService.getInstance(param));
    }

    @PostMapping("/instance/create")
    public ResultData<Void> createInstance(@RequestBody ModelingEntityInstanceAddParam param) {
        modelingEntityService.createInstance(param);
        return ResultData.OK;
    }

    @PostMapping("/instance/update")
    public ResultData<Void> updateInstance(@RequestBody ModelingEntityInstanceUpdateParam param) {
        modelingEntityService.updateEntityInstance(param);
        return ResultData.OK;
    }

    @DeleteMapping("/instance")
    public ResultData<Void> deleteInstance(@RequestBody ModelingEntityInstanceDeleteParam param) {
        modelingEntityService.deleteEntityInstance(param);
        return ResultData.OK;
    }


}
