package com.l1yp.model.param.workflow;

import com.l1yp.model.db.workflow.model.FieldScope;

public class WorkflowFieldFindParam {

    private FieldScope scope;

    private String wfKey;

    public FieldScope getScope() {
        return scope;
    }

    public void setScope(FieldScope scope) {
        this.scope = scope;
    }

    public String getWfKey() {
        return wfKey;
    }

    public void setWfKey(String wfKey) {
        this.wfKey = wfKey;
    }
}
