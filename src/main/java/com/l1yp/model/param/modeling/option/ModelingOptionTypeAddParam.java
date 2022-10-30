package com.l1yp.model.param.modeling.option;

import com.l1yp.model.db.modeling.ModelingOptionScope;

import javax.validation.constraints.NotBlank;

public class ModelingOptionTypeAddParam {
    @NotBlank
    private String name;

    private String remark;

    private ModelingOptionScope scope;

    private String mkey;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ModelingOptionScope getScope() {
        return scope;
    }

    public void setScope(ModelingOptionScope scope) {
        this.scope = scope;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }
}
