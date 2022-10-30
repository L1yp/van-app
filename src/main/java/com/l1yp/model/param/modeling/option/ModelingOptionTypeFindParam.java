package com.l1yp.model.param.modeling.option;

import com.l1yp.model.db.modeling.ModelingOptionScope;

import javax.validation.constraints.NotBlank;

public class ModelingOptionTypeFindParam {

    private String mkey;

    @NotBlank
    private ModelingOptionScope scope;

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public ModelingOptionScope getScope() {
        return scope;
    }

    public void setScope(ModelingOptionScope scope) {
        this.scope = scope;
    }
}
