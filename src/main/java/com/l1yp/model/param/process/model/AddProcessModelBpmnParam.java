package com.l1yp.model.param.process.model;

public class AddProcessModelBpmnParam {

    public AddProcessModelBpmnParam() {
    }

    public AddProcessModelBpmnParam(String processKey, String title) {
        this.processKey = processKey;
        this.title = title;
    }

    private String processKey;

    private String title;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
