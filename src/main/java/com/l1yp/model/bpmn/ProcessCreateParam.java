package com.l1yp.model.bpmn;

import java.util.Map;

public class ProcessCreateParam {

    private String processKey;

    private Map<String, Object> params;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
