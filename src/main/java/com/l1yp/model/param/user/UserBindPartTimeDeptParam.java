package com.l1yp.model.param.user;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 2022/2/22 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class UserBindPartTimeDeptParam {
    @NotNull
    @Min(0)
    private Long uid;

    @Size(min = 1)
    private List<Long> deptIds;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public List<Long> getDeptIds() {
        return deptIds;
    }

    public void setDeptIds(List<Long> deptIds) {
        this.deptIds = deptIds;
    }
}
