package com.l1yp.model.param.modeling.entity;

import javax.validation.constraints.Pattern;

public class ModelingEntityAddParam {

    @Pattern(regexp = "^[a-zA-Z_][a-zA-Z0-9_]*$", message = "key必须字母或下划线开头")
    private String mkey;

    private String name;

    private String remark;

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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
