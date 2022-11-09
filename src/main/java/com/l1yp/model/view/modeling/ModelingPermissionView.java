package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.permission.ExpressionModel;

import java.util.List;

public class ModelingPermissionView {

    private String id;

    private String roleId;

    private ModelingModule module;

    private String mkey;

    private int flags;

    private List<ExpressionModel> content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public int getFlags() {
        return flags;
    }

    public void setFlags(int flags) {
        this.flags = flags;
    }

    public List<ExpressionModel> getContent() {
        return content;
    }

    public void setContent(List<ExpressionModel> content) {
        this.content = content;
    }
}
