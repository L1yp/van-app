package com.l1yp.model.view.workflow;

import com.l1yp.model.db.workflow.form.OptionScope;

import java.util.Date;

public class WorkflowOptionTypeView {

    private String id;

    private String name;

    private String remark;

    private OptionScope scope;

    private String wfKey;

    private String updateBy;

    private Date updateTime;

    private String createBy;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public OptionScope getScope() {
        return scope;
    }

    public void setScope(OptionScope scope) {
        this.scope = scope;
    }

    public String getWfKey() {
        return wfKey;
    }

    public void setWfKey(String wfKey) {
        this.wfKey = wfKey;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
