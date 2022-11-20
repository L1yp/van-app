package com.l1yp.util;

import cn.dev33.satoken.stp.StpUtil;
import com.l1yp.model.db.system.User;

public class RequestUtils {

    private static final String SESSION_USER_KEY = "login-user";

    public static void putLoginUser(User user) {
        StpUtil.getSession(true).set(SESSION_USER_KEY, user);
    }

    public static User getLoginUser() {
        return (User) StpUtil.getSession().get(SESSION_USER_KEY);
    }

    public static String getLoginUserId() {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return null;
        }
        return loginUser.getId();
    }

}
