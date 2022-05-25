package com.l1yp.model.param.user;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 2022/2/22 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class UserBindRoleParam {
    @NotNull
    @Min(0)
    private Long uid;

    @NotNull
    @Size(min = 1)
    private List<Long> roleIds;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public List<Long> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }
}
