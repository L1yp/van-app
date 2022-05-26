package com.l1yp.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.l1yp.mapper.UserMapper;
import com.l1yp.model.common.ResultData;
import com.l1yp.model.db.SysUser;
import com.l1yp.model.param.user.*;
import com.l1yp.model.view.SysMenuView;
import com.l1yp.model.view.SysUserView;
import com.l1yp.model.view.UserLoginSuccessView;
import com.l1yp.model.view.UserLoginSuccessView.UserInfo;
import com.l1yp.util.RequestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    @Resource
    UserMapper userMapper;

    @Resource
    MenuService menuService;

    /**
     * 登录，返回用户菜单
     * @param uid 用户名
     * @param pwd 密码
     * @return
     */
    public ResultData<UserLoginSuccessView> login(String uid, String pwd) {
        SysUser user = userMapper.login(uid, pwd);
        if (user != null) {
            StpUtil.login(user.getId());

            RequestUtils.putLoginUser(user);
            List<SysMenuView> menus = menuService.findUserMenu();
            UserLoginSuccessView userLoginSuccessView = new UserLoginSuccessView();
            userLoginSuccessView.setMenus(menus);

            UserInfo userInfo = new UserInfo();
            BeanUtils.copyProperties(user, userInfo);
            userLoginSuccessView.setUserInfo(userInfo);
            SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
            userLoginSuccessView.setToken(tokenInfo.getTokenValue());
            return ResultData.ok(userLoginSuccessView);
        } else {
            return ResultData.err(400, "帐号或密码不正确");
        }
    }

    /**
     * 登录后查询用户菜单
     * @return 登录后响应结构
     */
    public ResultData<UserLoginSuccessView> menu() {
        SysUser loginUser = RequestUtils.getLoginUser();
        List<SysMenuView> menus = menuService.findUserMenu();
        UserLoginSuccessView userLoginSuccessView = new UserLoginSuccessView();
        userLoginSuccessView.setMenus(menus);
        UserInfo userInfo = new UserInfo();
        BeanUtils.copyProperties(loginUser, userInfo);
        userLoginSuccessView.setUserInfo(userInfo);
        return ResultData.ok(userLoginSuccessView);
    }

    public ResultData<List<String>> permission() {
        SysUser loginUser = RequestUtils.getLoginUser();
        return ResultData.ok(userMapper.permissions(loginUser.getId()));
    }

    /**
     * 查询用户列表
     * @param param 筛选条件
     * @return 用户列表
     */
    public ResultData<List<SysUserView>> pageUserList(UserListFindParam param) {
        List<SysUserView> sysUserViews = userMapper.pageList(param);
        return ResultData.ok(sysUserViews);
    }

    public ResultData<Void> updateUser(UserUpdateParam param) {
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(param, sysUser);
        userMapper.updateByPrimaryKeySelective(sysUser);
        return ResultData.OK;
    }

    /**
     * 绑定主部门
     * @param param 绑定参数
     * @return nil
     */
    public ResultData<Void> bindPrimaryDept(UserBindPrimaryDeptParam param) {
        userMapper.cancelBindDept(param.getUid(), 1);
        userMapper.bindPrimaryDept(param.getUid(), param.getPrimaryDeptId());
        return ResultData.OK;
    }

    /**
     * 绑定兼职部门
     * @param param 绑定参数
     * @return nil
     */
    public ResultData<Void> bindPartTimeDept(UserBindPartTimeDeptParam param) {
        userMapper.cancelBindDept(param.getUid(), 0);
        userMapper.bindPartTimeDept(param.getUid(), param.getDeptIds());
        return ResultData.OK;
    }

    public ResultData<Void> bindRole(UserBindRoleParam param) {
        userMapper.cancelBindRole(param.getUid());
        userMapper.bindRole(param.getUid(), param.getRoleIds());
        return ResultData.OK;
    }

    public ResultData<List<Long>> findBoundPartTimeDept(Long uid) {
        List<Long> boundPartTimeDeptId = userMapper.findBoundPartTimeDeptId(uid);
        return ResultData.ok(boundPartTimeDeptId);
    }

    public ResultData<Long> findBoundPrimaryDept(Long uid) {
        Long masterDeptId = userMapper.findMasterDeptId(uid);
        return ResultData.ok(masterDeptId);
    }

    public ResultData<List<Long>> findBoundRole(Long uid) {
        List<Long> boundRoles = userMapper.findBoundRoles(uid);
        return ResultData.ok(boundRoles);
    }

}
