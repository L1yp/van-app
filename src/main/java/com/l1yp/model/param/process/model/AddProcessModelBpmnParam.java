package com.l1yp.model.param.process.model;

public class AddProcessModelBpmnParam {

    public AddProcessModelBpmnParam() {
    }

    public AddProcessModelBpmnParam(String processKey) {
        this.processKey = processKey;
    }

    private String processKey;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }
}
