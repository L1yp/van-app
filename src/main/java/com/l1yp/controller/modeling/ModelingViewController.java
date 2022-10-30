package com.l1yp.controller.modeling;

import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.entity.ModelFindPageParam;
import com.l1yp.model.param.modeling.view.ModelingViewAddParam;
import com.l1yp.model.param.modeling.view.ModelingViewFindParam;
import com.l1yp.model.param.modeling.view.ModelingViewSearchParam;
import com.l1yp.model.param.modeling.view.ModelingViewUpdateParam;
import com.l1yp.model.view.modeling.ModelingViewDetailInfo;
import com.l1yp.model.view.modeling.ModelingViewSimpleInfo;
import com.l1yp.service.modeling.impl.ModelingViewServiceImpl;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/modeling/view")
public class ModelingViewController {

    @Resource
    ModelingViewServiceImpl modelingViewService;

    @GetMapping("/find")
    public ResultData<List<ModelingViewSimpleInfo>> findView(@Validated ModelingViewFindParam param) {
        return ResultData.ok(modelingViewService.findView(param));
    }

    @GetMapping("/search")
    public ResultData<List<ModelingViewDetailInfo>> searchView(@Validated ModelingViewSearchParam param) {
        return ResultData.ok(modelingViewService.searchView(param));
    }


    @PostMapping("/add")
    public ResultData<Void> addView(@RequestBody @Validated ModelingViewAddParam param) {
        modelingViewService.addView(param);
        return ResultData.OK;
    }


    @PostMapping("/update")
    public ResultData<Void> updateView(@RequestBody @Validated ModelingViewUpdateParam param) {
        modelingViewService.updateView(param);
        return ResultData.OK;
    }

    @DeleteMapping("{id}")
    public ResultData<Void> deleteView(@PathVariable("id") String id) {
        modelingViewService.deleteView(id);
        return ResultData.OK;
    }

    @PostMapping("/page")
    public ResultData<PageData<Map<String, Object>>> pageEntity(@Validated @RequestBody ModelFindPageParam param) {
        return ResultData.ok(modelingViewService.pageModeling(param));
    }

}
