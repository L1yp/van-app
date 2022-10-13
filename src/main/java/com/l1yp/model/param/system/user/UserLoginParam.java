package com.l1yp.model.param.system.user;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

public class UserLoginParam {

    @NotBlank
    private String username;

    @NotBlank
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 2022/2/22 Created by 𝑳𝒚𝒑(l1yp@qq.com),
     */
    public static class UserBindRoleParam {
        @NotNull
        @Min(0)
        private String uid;

        @NotNull
        @Size(min = 1)
        private List<String> roleIds;

        public String getUid() {
            return uid;
        }

        public void setUid(String uid) {
            this.uid = uid;
        }

        public List<String> getRoleIds() {
            return roleIds;
        }

        public void setRoleIds(List<String> roleIds) {
            this.roleIds = roleIds;
        }
    }
}
