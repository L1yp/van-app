package com.l1yp.model.param.modeling.entity;

import com.l1yp.model.db.modeling.ModelingModule;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ModelingEntityInstanceFindParam {

    @NotNull
    private ModelingModule module;

    @NotBlank
    private String mkey;

    @NotBlank
    private String id;

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
