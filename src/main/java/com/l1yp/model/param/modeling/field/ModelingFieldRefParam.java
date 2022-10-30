package com.l1yp.model.param.modeling.field;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;

public class ModelingFieldRefParam {

    private FieldModule module;

    private String mkey;

    private String fieldId;

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

    public String getFieldId() {
        return fieldId;
    }

    public void setFieldId(String fieldId) {
        this.fieldId = fieldId;
    }
}
