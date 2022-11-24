package com.l1yp.model.param.workflow.instance;

import javax.validation.constraints.NotBlank;

public class WorkflowInstanceQueryParam {

    @NotBlank
    private String mkey;

    @NotBlank
    private String instanceId;

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public String getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(String instanceId) {
        this.instanceId = instanceId;
    }
}
