package com.l1yp.model.param.modeling.field;

import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.field.FieldScheme;
import com.l1yp.model.db.modeling.field.FieldType;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class ModelingFieldAddParam {

    /**
     * 可选字段：是否关联流程
     */
    @Pattern(regexp = "^[a-zA-Z_][a-zA-Z0-9_]*$", message = "key必须字母或下划线开头")
    private String mkey;

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

    @NotNull
    private FieldScope scope;

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
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

}
