package com.l1yp.model.param.modeling.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ModelingEntityUpdateParam {

    @NotBlank
    private String id;

    @NotBlank
    private String name;

    private String remark;

    @NotNull
    private Integer status;

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
