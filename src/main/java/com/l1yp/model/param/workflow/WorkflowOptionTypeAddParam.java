package com.l1yp.model.param.workflow;

import com.l1yp.model.db.workflow.form.OptionScope;

import javax.validation.constraints.NotBlank;

public class WorkflowOptionTypeAddParam {
    @NotBlank
    private String name;

    private String remark;

    private OptionScope scope;

    private String wfKey;

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

    public OptionScope getScope() {
        return scope;
    }

    public void setScope(OptionScope scope) {
        this.scope = scope;
    }

    public String getWfKey() {
        return wfKey;
    }

    public void setWfKey(String wfKey) {
        this.wfKey = wfKey;
    }
}
