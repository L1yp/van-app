package com.l1yp.model.param.process;

import java.util.Date;

public class AddProcessFieldDefinitionParam {

    private String processKey;

    private String name;

    private Integer orderNo;

    private String label;

    private String description;

    private Long componentType;

    private String dbFieldType;

    private String dbDefaultValue;

    private String dictScope;

    private String dictIdent;

    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getComponentType() {
        return componentType;
    }

    public void setComponentType(Long componentType) {
        this.componentType = componentType;
    }

    public String getDbFieldType() {
        return dbFieldType;
    }

    public void setDbFieldType(String dbFieldType) {
        this.dbFieldType = dbFieldType;
    }

    public String getDbDefaultValue() {
        return dbDefaultValue;
    }

    public void setDbDefaultValue(String dbDefaultValue) {
        this.dbDefaultValue = dbDefaultValue;
    }

    public String getDictScope() {
        return dictScope;
    }

    public void setDictScope(String dictScope) {
        this.dictScope = dictScope;
    }

    public String getDictIdent() {
        return dictIdent;
    }

    public void setDictIdent(String dictIdent) {
        this.dictIdent = dictIdent;
    }
}
