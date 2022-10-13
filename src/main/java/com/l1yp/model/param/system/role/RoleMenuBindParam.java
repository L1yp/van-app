package com.l1yp.model.param.system.role;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

public class RoleMenuBindParam {

    @NotNull
    @Min(1)
    private String roleId;

    @NotNull
    @Size(min = 1, max = 100)
    private List<String> menuIds;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public List<String> getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(List<String> menuIds) {
        this.menuIds = menuIds;
    }
}
