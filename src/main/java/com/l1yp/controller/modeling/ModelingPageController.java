package com.l1yp.controller.modeling;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.page.ModelingPageBindParam;
import com.l1yp.model.param.modeling.page.ModelingPageFindParam;
import com.l1yp.model.param.modeling.page.ModelingPageUnbindParam;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.IModelingPageService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Validated
@RestController
@RequestMapping("/modeling/page")
public class ModelingPageController {

    @Resource
    IModelingPageService service;

    @GetMapping("/get")
    public ResultData<ModelingPageView> getPage(@Validated ModelingPageFindParam param) {
        return ResultData.ok(service.getPage(param));
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
