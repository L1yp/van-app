package com.l1yp.model.param.modeling.option;

import javax.validation.constraints.NotBlank;

public class ModelingOptionTypeUpdateParam {

    @NotBlank
    private String id;

    @NotBlank
    private String name;

    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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
}
