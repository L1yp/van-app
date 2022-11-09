package com.l1yp.model.param.modeling.permission;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.permission.ExpressionModel;

import java.util.List;

public class ModelingPermissionBindParam {

    private String roleId;

    private ModelingModule module;

    private String mkey;

    private Integer flags;

    private List<ExpressionModel> content;

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

    public Integer getFlags() {
        return flags;
    }

    public void setFlags(Integer flags) {
        this.flags = flags;
    }

    public List<ExpressionModel> getContent() {
        return content;
    }

    public void setContent(List<ExpressionModel> content) {
        this.content = content;
    }
}
