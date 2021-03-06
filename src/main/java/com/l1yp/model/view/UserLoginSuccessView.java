package com.l1yp.model.view;

import cn.dev33.satoken.stp.SaTokenInfo;

import java.util.List;

public class UserLoginSuccessView {

    private List<SysMenuView> menus;

    private UserInfo userInfo;

    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public static class UserInfo {
        private String username;
        private String nickname;
        private String phone;
        private String avatar;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getNickname() {
            return nickname;
        }

        public void setNickname(String nickname) {
            this.nickname = nickname;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getAvatar() {
            return avatar;
        }

        public void setAvatar(String avatar) {
            this.avatar = avatar;
        }
    }


    public List<SysMenuView> getMenus() {
        return menus;
    }

    public void setMenus(List<SysMenuView> menus) {
        this.menus = menus;
    }
}
