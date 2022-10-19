package com.l1yp.model.view.workflow;

import java.util.Date;
import java.util.List;

public class WorkflowTypeDefView {

    private String id;
    private String key;
    private String name;
    private String remark;
    private String codeGenRule;
    private Integer status;
    private String updateBy;
    private Date updateTime;
    private String createBy;
    private String createTime;

    private List<WorkflowTypeVerView> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCodeGenRule() {
        return codeGenRule;
    }

    public void setCodeGenRule(String codeGenRule) {
        this.codeGenRule = codeGenRule;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public List<WorkflowTypeVerView> getChildren() {
        return children;
    }

    public void setChildren(List<WorkflowTypeVerView> children) {
        this.children = children;
    }
}