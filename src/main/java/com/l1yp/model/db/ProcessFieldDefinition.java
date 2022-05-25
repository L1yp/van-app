package com.l1yp.model.db;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "process_model_field_definition")
public class ProcessFieldDefinition {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

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

    private String updateBy;

    private Date updateTime;

    private Date createTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDictIdent() {
        return dictIdent;
    }

    public void setDictIdent(String dictIdent) {
        this.dictIdent = dictIdent;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public boolean isUserType() {
        return componentType == 6 || componentType == 7;
    }

    public boolean isDictType() {
        return componentType == 3 || componentType == 4;
    }

    public boolean isDeptType() {
        return componentType == 9 || componentType == 10;
    }

}
