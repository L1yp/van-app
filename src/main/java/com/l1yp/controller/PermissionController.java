package com.l1yp.controller;

import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysPermission;
import com.l1yp.model.db.SysRole;
import com.l1yp.model.param.permission.PermissionAddParam;
import com.l1yp.model.param.permission.PermissionUpdateParam;
import com.l1yp.model.param.role.RoleAddParam;
import com.l1yp.model.param.role.RoleUpdateParam;
import com.l1yp.service.PermissionService;
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

@Validated
@RestController
@RequestMapping("/permission")
public class PermissionController {

    @Resource
    PermissionService permissionService;


    @GetMapping("/find")
    public ResultData<List<SysPermission>> findRoles() {
        return permissionService.findPermission();
    }


    @PostMapping("/add")
    public ResultData<Void> addPermission(@Validated @RequestBody PermissionAddParam param) {
        return permissionService.addPermission(param);
    }

    @PostMapping("/update")
    public ResultData<Void> updatePermission(@Validated @RequestBody PermissionUpdateParam param) {
        return permissionService.updatePermission(param);
    }

    @DeleteMapping("/{id}")
    public ResultData<Void> deleteMenu(@PathVariable("id") Long id) {
        return permissionService.deletePermission(id);
    }

    @DeleteMapping("/batch/{ids}")
    public ResultData<Void> deleteMenu(@PathVariable("ids") List<Long> ids) {
        return permissionService.batchDeletePermission(ids);
    }


}
