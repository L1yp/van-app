package com.l1yp.model.param.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;

public class ModelingPermissionFindParam {

    private String roleId;

    private FieldModule module;

    private String mkey;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public FieldModule getModule() {
        return module;
    }

    public void setModule(FieldModule module) {
        this.module = module;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }
}
