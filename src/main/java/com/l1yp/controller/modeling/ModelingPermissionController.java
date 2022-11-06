package com.l1yp.controller.modeling;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.modeling.permission.ModelingPermissionBindParam;
import com.l1yp.model.param.modeling.permission.ModelingPermissionFindParam;
import com.l1yp.model.view.modeling.ModelingPermissionView;
import com.l1yp.service.modeling.impl.ModelingPermissionServiceImpl;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/modeling/permission")
public class ModelingPermissionController {

    @Resource
    ModelingPermissionServiceImpl modelingPermissionService;

    @GetMapping("/find")
    public ResultData<ModelingPermissionView> getPermissionContent(@Validated ModelingPermissionFindParam param) {
        return ResultData.ok(modelingPermissionService.getPermission(param));
    }


    @PostMapping("/bind")
    public ResultData<Void> getPermissionContent(@Validated @RequestBody ModelingPermissionBindParam param) {
        modelingPermissionService.bingPermission(param);
        return ResultData.OK;
    }

}
