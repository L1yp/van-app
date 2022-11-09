package com.l1yp.model.param.modeling.permission;

import com.l1yp.model.db.modeling.ModelingModule;

public class ModelingPermissionFindParam {

    private String roleId;

    private ModelingModule module;

    private String mkey;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public ModelingModule getModule() {
        return module;
    }

    public void setModule(ModelingModule module) {
        this.module = module;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }
}
