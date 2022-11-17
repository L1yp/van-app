package com.l1yp.controller.modeling;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.page.ModelingPageAddAndBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageAddParam;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUpdateParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.IModelingPageService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Validated
@RestController
@RequestMapping("/modeling/page")
@SaCheckLogin
public class ModelingPageController {

    @Resource
    IModelingPageService service;

    @GetMapping("/{id}")
    public ResultData<ModelingPageView> getPage(@PathVariable("id") String pageId) {
        return ResultData.ok(service.getPageById(pageId));
    }

    @GetMapping("/find")
    public ResultData<ModelingPageView> findPage(@Validated ModelingPageFindParam param) {
        return ResultData.ok(service.findPage(param));
    }

    @PostMapping("/add")
    public ResultData<Void> addPage(@Validated @RequestBody ModelingPageAddParam param) {
        service.addPage(param);
        return ResultData.OK;
    }

    @PostMapping("/add_and_bind")
    public ResultData<Void> addAndBindPage(@Validated @RequestBody ModelingPageAddAndBindParam param) {
        service.addAndBindPage(param);
        return ResultData.OK;
    }


    @GetMapping("/update")
    public ResultData<Void> updatePage(@Validated @RequestBody ModelingPageUpdateParam param) {
        service.updatePage(param);
        return ResultData.OK;
    }

    @PostMapping("/bind")
    public ResultData<Void> bind(@RequestBody ModelingPageBindParam param) {
        service.bindPage(param);
        return ResultData.OK;
    }

    @PostMapping("/unbind")
    public ResultData<Void> unbind(@RequestBody ModelingPageUnbindParam param) {
        service.unbindPage(param);
        return ResultData.OK;
    }

}
