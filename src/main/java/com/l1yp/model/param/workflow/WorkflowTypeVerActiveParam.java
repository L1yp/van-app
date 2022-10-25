package com.l1yp.model.param.workflow;

import javax.validation.constraints.NotBlank;

public class WorkflowTypeVerActiveParam {

    @NotBlank
    private String id;

    @NotBlank
    private String remark;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
