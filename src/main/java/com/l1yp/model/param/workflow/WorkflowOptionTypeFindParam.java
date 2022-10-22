package com.l1yp.model.param.workflow;

import com.l1yp.model.db.workflow.form.OptionScope;

public class WorkflowOptionTypeFindParam {

    private String wfKey;

    private OptionScope scope;

    public String getWfKey() {
        return wfKey;
    }

    public void setWfKey(String wfKey) {
        this.wfKey = wfKey;
    }

    public OptionScope getScope() {
        return scope;
    }

    public void setScope(OptionScope scope) {
        this.scope = scope;
    }
}
