package com.l1yp.model.param.process.model;

public class ConfigProcessStartPageParam {

    private String processKey;

    private Long processModelPageId;

    private String pageWidth;

    private String labelWidth;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public Long getProcessModelPageId() {
        return processModelPageId;
    }

    public void setProcessModelPageId(Long processModelPageId) {
        this.processModelPageId = processModelPageId;
    }

    public String getPageWidth() {
        return pageWidth;
    }

    public void setPageWidth(String pageWidth) {
        this.pageWidth = pageWidth;
    }

    public String getLabelWidth() {
        return labelWidth;
    }

    public void setLabelWidth(String labelWidth) {
        this.labelWidth = labelWidth;
    }

}
