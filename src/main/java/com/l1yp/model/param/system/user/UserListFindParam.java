package com.l1yp.model.param.system.user;

import com.l1yp.model.common.PageParam;

/**
 * 2022/2/19 Created by 𝑳𝒚𝒑(l1yp@qq.com), 查询用户列表
 */
public class UserListFindParam extends PageParam {

    private String username;

    private String nickname;

    private String phone;

    private String deptId;

    private Integer status;

    private String email;

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

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
