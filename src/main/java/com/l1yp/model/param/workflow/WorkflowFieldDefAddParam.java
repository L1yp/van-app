package com.l1yp.model.param.workflow;

import com.l1yp.model.db.workflow.field.FieldScheme;
import com.l1yp.model.db.workflow.model.FieldScope;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class WorkflowFieldDefAddParam {

    /**
     * 可选字段：是否关联流程
     */
    private String wfKey;

    /**
     * 字段名
     */
    private String field;

    /**
     * 标签名
     */
    private String label;

    /**
     * 字段说明
     */
    private String remark;

    /**
     * 字段宽度
     */
    private Integer width;

    /**
     * 字段类型
     * 字符串
     * 数字
     */
    private String type;

    /**
     * 字段定义
     */
    private FieldScheme scheme;

    @NotNull
    private FieldScope scope;

    public String getWfKey() {
        return wfKey;
    }

    public void setWfKey(String wfKey) {
        this.wfKey = wfKey;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public FieldScheme getScheme() {
        return scheme;
    }

    public void setScheme(FieldScheme scheme) {
        this.scheme = scheme;
    }

    public FieldScope getScope() {
        return scope;
    }

    public void setScope(FieldScope scope) {
        this.scope = scope;
    }
}
