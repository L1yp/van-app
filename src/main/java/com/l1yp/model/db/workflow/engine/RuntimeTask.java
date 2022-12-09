package com.l1yp.model.db.workflow.engine;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

public class RuntimeTask {

    private String id;

    private Integer rev;

    private String executionId;


    private String processInstanceId;

    private String processDefinitionId;

    private String taskDefId;

    private String scopeId;

    private String subScopeId;

    private String scopeType;

    private String scopeDefinitionId;

    private String propagatedStageInstanceId;

    private String name;

    private String parentTaskId;

    private String description;

    private String taskDefinitionKey;

    private String owner;

    private String assignee;

    private String delegation;

    private String priority;

    private Date createTime;

    private Date dueDate;

    private String category;

    private Integer suspensionState;

    private String tenantId;

    private String formKey;

    private Date claimTime;

    private Boolean isCountEnabled;

    private Integer varCount;

    private Integer idLinkCount;

    private Integer subTaskCount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getRev() {
        return rev;
    }

    public void setRev(Integer rev) {
        this.rev = rev;
    }

    public String getExecutionId() {
        return executionId;
    }

    public void setExecutionId(String executionId) {
        this.executionId = executionId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getProcessDefinitionId() {
        return processDefinitionId;
    }

    public void setProcessDefinitionId(String processDefinitionId) {
        this.processDefinitionId = processDefinitionId;
    }

    public String getTaskDefId() {
        return taskDefId;
    }

    public void setTaskDefId(String taskDefId) {
        this.taskDefId = taskDefId;
    }

    public String getScopeId() {
        return scopeId;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }

    public String getSubScopeId() {
        return subScopeId;
    }

    public void setSubScopeId(String subScopeId) {
        this.subScopeId = subScopeId;
    }

    public String getScopeType() {
        return scopeType;
    }

    public void setScopeType(String scopeType) {
        this.scopeType = scopeType;
    }

    public String getScopeDefinitionId() {
        return scopeDefinitionId;
    }

    public void setScopeDefinitionId(String scopeDefinitionId) {
        this.scopeDefinitionId = scopeDefinitionId;
    }

    public String getPropagatedStageInstanceId() {
        return propagatedStageInstanceId;
    }

    public void setPropagatedStageInstanceId(String propagatedStageInstanceId) {
        this.propagatedStageInstanceId = propagatedStageInstanceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentTaskId() {
        return parentTaskId;
    }

    public void setParentTaskId(String parentTaskId) {
        this.parentTaskId = parentTaskId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTaskDefinitionKey() {
        return taskDefinitionKey;
    }

    public void setTaskDefinitionKey(String taskDefinitionKey) {
        this.taskDefinitionKey = taskDefinitionKey;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getDelegation() {
        return delegation;
    }

    public void setDelegation(String delegation) {
        this.delegation = delegation;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getSuspensionState() {
        return suspensionState;
    }

    public void setSuspensionState(Integer suspensionState) {
        this.suspensionState = suspensionState;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getFormKey() {
        return formKey;
    }

    public void setFormKey(String formKey) {
        this.formKey = formKey;
    }

    public Date getClaimTime() {
        return claimTime;
    }

    public void setClaimTime(Date claimTime) {
        this.claimTime = claimTime;
    }

    public Boolean getCountEnabled() {
        return isCountEnabled;
    }

    public void setCountEnabled(Boolean countEnabled) {
        isCountEnabled = countEnabled;
    }

    public Integer getVarCount() {
        return varCount;
    }

    public void setVarCount(Integer varCount) {
        this.varCount = varCount;
    }

    public Integer getIdLinkCount() {
        return idLinkCount;
    }

    public void setIdLinkCount(Integer idLinkCount) {
        this.idLinkCount = idLinkCount;
    }

    public Integer getSubTaskCount() {
        return subTaskCount;
    }

    public void setSubTaskCount(Integer subTaskCount) {
        this.subTaskCount = subTaskCount;
    }
}
