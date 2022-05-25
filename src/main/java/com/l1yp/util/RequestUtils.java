package com.l1yp.util;

import cn.dev33.satoken.stp.StpUtil;
import com.l1yp.model.db.SysUser;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

public class RequestUtils {

    private static final String SESSION_USER_KEY = "login-user";

    public static void putLoginUser(SysUser user) {
        StpUtil.getSession(true).set(SESSION_USER_KEY, user);
    }

    public static SysUser getLoginUser() {
        return (SysUser) StpUtil.getSession().get(SESSION_USER_KEY);
    }

}
