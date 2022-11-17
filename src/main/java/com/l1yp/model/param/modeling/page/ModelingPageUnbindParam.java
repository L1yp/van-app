package com.l1yp.model.param.modeling.page;

import com.l1yp.model.db.modeling.ModelingModule;

public class ModelingPageUnbindParam {

    private ModelingModule module;

    private String mkey;

    private String name;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
