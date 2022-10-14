package com.l1yp.service.system;

import com.l1yp.model.common.PageData;
import com.l1yp.model.param.system.user.UserListFindParam;
import com.l1yp.model.param.system.user.UserLoginParam.UserBindRoleParam;
import com.l1yp.model.param.system.user.UserUpdateParam;
import com.l1yp.model.view.LoginResult;
import com.l1yp.model.view.system.UserView;

import java.util.List;

public interface IUserService {

    /**
     * 用户登录
     * @param uid 用户名
     * @param pwd 密码MD5
     * @return 登录结果
     */
    LoginResult login(String uid, String pwd);

    /**
     * 获取用户登录信息
     * @return
     */
    LoginResult requestLoginState();


    PageData<UserView> pageUserList(UserListFindParam param);

    List<UserView> searchUserList(String key);


    void update(UserUpdateParam param);


    void bindRole(UserBindRoleParam param);

    List<String> findPartTimeDept();

    List<String> findRoles(String uid);

}
