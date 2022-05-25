package com.l1yp.model.param.user;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 2022/2/22 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class UserBindPrimaryDeptParam {
    @NotNull
    @Min(0)
    private Long uid;
    @NotNull
    @Min(0)
    private Long primaryDeptId;


    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getPrimaryDeptId() {
        return primaryDeptId;
    }

    public void setPrimaryDeptId(Long primaryDeptId) {
        this.primaryDeptId = primaryDeptId;
    }

}
