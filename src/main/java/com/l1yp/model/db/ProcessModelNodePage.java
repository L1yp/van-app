package com.l1yp.model.db;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "process_model_node_page")
public class ProcessModelNodePage {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private String processKey;

    private Long processBpmnId;

    private String nodeId;

    private Long processModelPageId;

    private String pageWidth;

    private String labelWidth;

    private Integer comment; /* 0=no,1=optional,2=required */

    private String updateBy;

    private Date updateTime;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProcessBpmnId() {
        return processBpmnId;
    }

    public void setProcessBpmnId(Long processBpmnId) {
        this.processBpmnId = processBpmnId;
    }

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
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

    public Integer getComment() {
        return comment;
    }

    public void setComment(Integer comment) {
        this.comment = comment;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
