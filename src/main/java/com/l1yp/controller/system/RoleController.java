package com.l1yp.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.role.RoleAddParam;
import com.l1yp.model.param.system.role.RoleMenuBindParam;
import com.l1yp.model.param.system.role.RolePageParam;
import com.l1yp.model.param.system.role.RoleUpdateParam;
import com.l1yp.model.view.system.RoleView;
import com.l1yp.service.system.IRoleService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;

@RestController
@RequestMapping("/role")
@SaCheckLogin
public class RoleController {


    @Value("${app.mode}")
    private String mode;

    @Resource
    IRoleService service;

    @GetMapping("/find")
    public ResultData<List<RoleView>> findRoles() {
        return ResultData.ok(service.findRole());
    }


    @PostMapping("/add")
    public ResultData<Void> addRole(@Validated @RequestBody RoleAddParam param) {
        service.addRole(param);
        return ResultData.OK;
    }

    @PostMapping("/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody RoleUpdateParam param) {
        service.updateRole(param);
        return ResultData.OK;
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") String id) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.deleteRole(id);
        return ResultData.OK;
    }

    @DeleteMapping("/batch/{ids}")
    public ResultData<Void> deleteMenu(@PathVariable("ids") List<String> ids) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.batchDeleteRole(ids);
        return ResultData.OK;
    }

    @PostMapping("/menu/bind")
    public ResultData<Void> bindMenu(@Validated @RequestBody RoleMenuBindParam param) {
        if ("preview".equals(mode)) {
            return ResultData.err(500, "演示环境禁用此操作");
        }
        service.bindMenu(param);
        return ResultData.OK;
    }

    @GetMapping("/menu")
    public ResultData<List<String>> menuBound(@NotNull String roleId) {
        return ResultData.ok(service.menuBound(roleId));
    }



}
