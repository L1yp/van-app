package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.modeling.field.FieldType;

import java.util.Date;

public class ModelingFieldDefView {


    private String id;

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
    private FieldType type;

    /**
     * 字段定义
     */
    private FieldScheme scheme;

    private FieldScope scope;

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

    public FieldType getType() {
        return type;
    }

    public void setType(FieldType type) {
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
