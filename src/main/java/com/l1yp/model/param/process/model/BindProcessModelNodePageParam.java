package com.l1yp.model.param.process.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class BindProcessModelNodePageParam {

    @NotNull
    private Long id;

    @NotBlank
    private String processKey;

    @NotNull
    private Long processBpmnId;

    @NotNull
    private Long processModelPageId;

    @NotBlank
    private String nodeId;

    @NotBlank
    private String pageWidth;

    @NotBlank
    private String labelWidth;

    @NotNull
    private Integer comment;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public Long getProcessBpmnId() {
        return processBpmnId;
    }

    public void setProcessBpmnId(Long processBpmnId) {
        this.processBpmnId = processBpmnId;
    }

    public Long getProcessModelPageId() {
        return processModelPageId;
    }

    public void setProcessModelPageId(Long processModelPageId) {
        this.processModelPageId = processModelPageId;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
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

    public Integer getComment() {
        return comment;
    }

    public void setComment(Integer comment) {
        this.comment = comment;
    }
}
