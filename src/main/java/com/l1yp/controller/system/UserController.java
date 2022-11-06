package com.l1yp.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.l1yp.model.common.PageData;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.param.system.user.UserListFindParam;
import com.l1yp.model.param.system.user.UserLoginParam;
import com.l1yp.model.param.system.user.UserLoginParam.UserBindRoleParam;
import com.l1yp.model.param.system.user.UserUpdateParam;
import com.l1yp.model.view.LoginResult;
import com.l1yp.model.view.system.UserView;
import com.l1yp.service.system.IUserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Validated
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    IUserService userService;

    @PostMapping("/login")
    public ResultData<LoginResult> login(@Validated @RequestBody UserLoginParam param) {
        LoginResult result = userService.login(param.getUsername(), param.getPassword());
        return ResultData.ok(result);
    }

    @GetMapping("/page")
    public ResultData<PageData<UserView>> findPage(@Validated UserListFindParam param) {
        PageData<UserView> pageData = userService.pageUserList(param);
        return ResultData.ok(pageData);
    }

    @GetMapping("/search")
    public ResultData<List<UserView>> search(@Validated String key) {
        return ResultData.ok(userService.searchUserList(key));
    }

    @PostMapping("/update")
    public ResultData<Void> updateUser(@Validated @RequestBody UserUpdateParam param) {
        userService.update(param);
        return ResultData.OK;
    }

    @SaCheckLogin
    @GetMapping("/role")
    public ResultData<List<String>> role(@RequestParam String uid) {
        return ResultData.ok(userService.findRoles(uid));
    }


    @SaCheckLogin
    @GetMapping("/menu")
    public ResultData<LoginResult> menu() {
        return ResultData.ok(userService.requestLoginState());
    }

    @SaCheckLogin
    @PostMapping("/role/bind")
    public ResultData<Void> bindRoles(@Validated @RequestBody UserBindRoleParam param) {
        userService.bindRole(param);
        return ResultData.OK;
    }

    @SaCheckLogin
    @GetMapping("/pt/dept")
    public ResultData<List<String>> findPartTimeDept() {
        return ResultData.ok(userService.findPartTimeDept());
    }

    @GetMapping("/list/{id_list}")
    public ResultData<List<UserView>> listUserViewByIdList(@PathVariable("id_list") List<String> idList) {
        return ResultData.ok(userService.listUserViewByIdList(idList));
    }

}
