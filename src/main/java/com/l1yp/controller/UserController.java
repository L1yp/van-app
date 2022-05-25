package com.l1yp.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysPermission;
import com.l1yp.model.param.user.*;
import com.l1yp.model.view.SysUserView;
import com.l1yp.model.view.UserBoundDeptView;
import com.l1yp.model.view.UserLoginSuccessView;
import com.l1yp.service.UserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Validated
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    UserService userService;

    @PostMapping("/login")
    public ResultData<UserLoginSuccessView> login(@Validated @RequestBody UserLoginParam param) {
        return userService.login(param.getUsername(), param.getPassword());
    }

    @GetMapping("/page")
    public ResultData<List<SysUserView>> findPage(@Validated UserListFindParam param) {
        return userService.pageUserList(param);
    }

    @SaCheckPermission("system:user:update")
    @PostMapping("/update")
    public ResultData<Void> updateUser(@Validated @RequestBody UserUpdateParam param) {
        return userService.updateUser(param);
    }


    @SaCheckLogin
    @GetMapping("/menu")
    public ResultData<UserLoginSuccessView> menu() {
        return userService.menu();
    }

    @SaCheckLogin
    @GetMapping("/permission")
    public ResultData<List<String>> permission() {
        return userService.permission();
    }


    @SaCheckLogin
    @GetMapping("/dept/part-time/bound/find")
    public ResultData<List<Long>> findBoundPartTimeDept(Long uid) {
        return userService.findBoundPartTimeDept(uid);
    }

    @SaCheckLogin
    @GetMapping("/dept/primary/bound/find")
    public ResultData<Long> findBoundPrimaryDept(Long uid) {
        return userService.findBoundPrimaryDept(uid);
    }

    @SaCheckLogin
    @GetMapping("/role/bound/find")
    public ResultData<List<Long>> findBoundRole(Long uid) {
        return userService.findBoundRole(uid);
    }

    @SaCheckLogin
    @PostMapping("/role/bind")
    public ResultData<Void> bindRoles(@Validated @RequestBody UserBindRoleParam param) {
        return userService.bindRole(param);
    }

    @SaCheckLogin
    @PostMapping("/dept/part-time/bind")
    public ResultData<Void> bindPartTimeDept(@Validated @RequestBody UserBindPartTimeDeptParam param) {
        return userService.bindPartTimeDept(param);
    }

    @SaCheckLogin
    @PostMapping("/dept/primary/bind")
    public ResultData<Void> bindPrimaryDept(@Validated @RequestBody UserBindPrimaryDeptParam param) {
        return userService.bindPrimaryDept(param);
    }

}
