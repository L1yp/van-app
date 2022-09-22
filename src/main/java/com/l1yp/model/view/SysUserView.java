package com.l1yp.model.view;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 2022/2/19 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class SysUserView {
    private Long id;

    private String username;

    private String nickname;

    private String phone;

    private String email;

    private String avatar;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getLabel() {
        // Lyp <A52736, IT>
        return nickname + "<" + username + ">";
    }
}
