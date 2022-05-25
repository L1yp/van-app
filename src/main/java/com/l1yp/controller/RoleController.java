package com.l1yp.controller;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysRole;
import com.l1yp.model.param.role.RoleAddParam;
import com.l1yp.model.param.role.RoleMenuBindParam;
import com.l1yp.model.param.role.RolePermissionBindParam;
import com.l1yp.model.param.role.RoleUpdateParam;
import com.l1yp.service.RoleService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {


    @Resource
    RoleService service;

    @GetMapping("/find")
    public ResultData<List<SysRole>> findRoles() {
        return service.findRole();
    }


    @PostMapping("/add")
    public ResultData<Void> addRole(@Validated @RequestBody RoleAddParam param) {
        return service.addRole(param);
    }

    @PostMapping("/update")
    public ResultData<Void> updateMenu(@Validated @RequestBody RoleUpdateParam param) {
        return service.updateRole(param);
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") Long id) {
        return service.deleteRole(id);
    }

    @DeleteMapping("/batch/{ids}")
    public ResultData<Void> deleteMenu(@PathVariable("ids") List<Long> ids) {
        return service.batchDeleteRole(ids);
    }

    @PostMapping("/menu/bind")
    public ResultData<Void> bindMenu(@Validated @RequestBody RoleMenuBindParam param) {
        return service.bindMenu(param);
    }

    @GetMapping("/menu/bound")
    public ResultData<List<Long>> menuBound(@NotNull @Min(1)Long roleId) {
        return service.menuBound(roleId);
    }

    @PostMapping("/permission/bind")
    public ResultData<Void> bindPermission(@Validated @RequestBody RolePermissionBindParam param) {
        return service.bindPermission(param);
    }

    @GetMapping("/permission/bound")
    public ResultData<List<Long>> permissionBound(@NotNull @Min(1)Long roleId) {
        return service.permissionBound(roleId);
    }

}
