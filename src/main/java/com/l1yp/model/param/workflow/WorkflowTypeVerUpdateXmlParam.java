package com.l1yp.model.param.workflow;

import javax.validation.constraints.NotBlank;

public class WorkflowTypeVerUpdateXmlParam {

    @NotBlank
    private String id;

    @NotBlank
    private String xml;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getXml() {
        return xml;
    }

    public void setXml(String xml) {
        this.xml = xml;
    }
}
