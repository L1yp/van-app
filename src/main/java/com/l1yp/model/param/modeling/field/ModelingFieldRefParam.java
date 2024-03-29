package com.l1yp.model.param.modeling.field;

import com.l1yp.model.db.modeling.ModelingModule;

public class ModelingFieldRefParam {

    private ModelingModule module;

    private String mkey;

    private String fieldId;

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

    public String getFieldId() {
        return fieldId;
    }

    public void setFieldId(String fieldId) {
        this.fieldId = fieldId;
    }
}
