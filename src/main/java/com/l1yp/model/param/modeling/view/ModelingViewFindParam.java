package com.l1yp.model.param.modeling.view;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ModelingViewFindParam {

    @NotNull
    private FieldModule module;

    @NotBlank
    private String mkey;


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
