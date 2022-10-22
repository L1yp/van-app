package com.l1yp.model.db.workflow.model;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.l1yp.model.param.workflow.CodeGenRule;
import com.l1yp.model.view.workflow.WorkflowTypeDefView;
import com.l1yp.util.BeanCopierUtil;

import java.util.Date;

/**
 * 流程类型模型表
 */
@TableName(value = "workflow_type_def", autoResultMap = true)
public class WorkflowTypeDef {

    public static final Integer ON = 0;
    public static final Integer OFF = 0;


    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    @TableField("`key`")
    private String key;

    private String name;

    @TableField(typeHandler = JacksonTypeHandler.class)
    private CodeGenRule codeGenRule;

    private String remark;

    private Integer status;

    private String processDefinitionId;

    private String updateBy;
    private String createBy;

    private Date updateTime;

    private Date createTime;

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

    public CodeGenRule getCodeGenRule() {
        return codeGenRule;
    }

    public void setCodeGenRule(CodeGenRule codeGenRule) {
        this.codeGenRule = codeGenRule;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getProcessDefinitionId() {
        return processDefinitionId;
    }

    public void setProcessDefinitionId(String processDefinitionId) {
        this.processDefinitionId = processDefinitionId;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public WorkflowTypeDefView toView() {
        WorkflowTypeDefView view = new WorkflowTypeDefView();
        BeanCopierUtil.copy(this, view);
        return view;
    }

}
