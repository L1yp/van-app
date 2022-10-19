package com.l1yp.model.param.workflow;

import com.l1yp.model.common.PageParam;

public class WorkflowTypeDefPageParam extends PageParam {

    private String name;

    private String remark;

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
