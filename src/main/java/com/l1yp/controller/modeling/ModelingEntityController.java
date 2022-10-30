package com.l1yp.controller.modeling;


import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.entity.ModelingEntityAddParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityFindParam;
import com.l1yp.model.param.modeling.entity.ModelingEntityUpdateParam;
import com.l1yp.model.view.modeling.ModelingEntityView;
import com.l1yp.service.modeling.impl.ModelingEntityServiceImpl;
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
import java.util.List;

@RestController
@RequestMapping("/modeling/entity")
public class ModelingEntityController {

    @Resource
    ModelingEntityServiceImpl modelingEntityService;

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
        modelingEntityService.deleteEntity(id);
        return ResultData.OK;
    }


}
