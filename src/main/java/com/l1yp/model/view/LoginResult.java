package com.l1yp.model.view;

import com.l1yp.model.view.system.MenuView;

import java.util.List;

public class LoginResult {

    private List<MenuView> menus;

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

        private String id;

        private String username;
        private String nickname;
        private String phone;
        private String avatar;

        private String deptId;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

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

        public String getDeptId() {
            return deptId;
        }

        public void setDeptId(String deptId) {
            this.deptId = deptId;
        }
    }


    public List<MenuView> getMenus() {
        return menus;
    }

    public void setMenus(List<MenuView> menus) {
        this.menus = menus;
    }
}
