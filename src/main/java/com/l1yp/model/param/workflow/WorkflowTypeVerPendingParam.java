package com.l1yp.model.param.workflow;

import javax.validation.constraints.NotBlank;

public class WorkflowTypeVerPendingParam {

    @NotBlank
    private String id;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
