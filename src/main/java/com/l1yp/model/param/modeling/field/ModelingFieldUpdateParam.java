package com.l1yp.model.param.modeling.field;

import com.l1yp.model.db.modeling.field.FieldScheme;

public class ModelingFieldUpdateParam {

    private String id;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
}
