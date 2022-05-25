package com.l1yp.model.param.user;

import javax.validation.constraints.NotNull;

/**
 * 2022/2/21 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class UserUpdateParam {

    @NotNull
    private Long id;

    private String nickname;

    private String password;

    private String phone;

    private String email;

    private String avatar;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
