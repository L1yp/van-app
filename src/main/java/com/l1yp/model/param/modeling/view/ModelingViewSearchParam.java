package com.l1yp.model.param.modeling.view;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ModelingViewSearchParam {

    @NotNull
    private FieldModule module;

    @NotBlank
    private String mkey;

    private String name;

    private String updateBy;

    private String createBy;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
