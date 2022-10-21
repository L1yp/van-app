package com.l1yp.model.param.workflow;

public class WorkflowFieldDefAddParam {

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
    private String scheme;


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

    public String getScheme() {
        return scheme;
    }

    public void setScheme(String scheme) {
        this.scheme = scheme;
    }
}
