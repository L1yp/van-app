package com.l1yp.model.param.workflow.instance;

import java.util.Map;

/**
 * 启动流程参数
 */
public class WorkflowEngineInstanceCreateParam {

    private String mkey;

    private Map<String, Object> formData;

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public Map<String, Object> getFormData() {
        return formData;
    }

    public void setFormData(Map<String, Object> formData) {
        this.formData = formData;
    }
}
