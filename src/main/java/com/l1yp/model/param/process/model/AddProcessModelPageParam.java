package com.l1yp.model.param.process.model;

import javax.validation.constraints.NotBlank;

public class AddProcessModelPageParam {

    @NotBlank
    private String processKey;

    private String name;

    private String remark;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
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
