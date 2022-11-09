package com.l1yp.model.param.modeling.view;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ModelingViewFindParam {

    @NotNull
    private ModelingModule module;

    @NotBlank
    private String mkey;


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
