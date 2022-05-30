package com.l1yp.model.param.process.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class AddWFColumnParam {
    @NotBlank
    private String processKey;

    @NotBlank
    private String columnName;

    @NotBlank
    private String label;

    @NotBlank
    private String dbType;

    private String defaultVal;

    public boolean nullable; // NULL/NOT NULL

    private String comment;

    @NotNull
    @Min(1)
    private Integer componentType;

    private String dictScope;

    private String dictIdent;


    public String getProcessKey() {
        return processKey;
    }

    public void setProcessKey(String processKey) {
        this.processKey = processKey;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDbType() {
        return dbType;
    }

    public void setDbType(String dbType) {
        this.dbType = dbType;
    }

    public String getDefaultVal() {
        return defaultVal;
    }

    public void setDefaultVal(String defaultVal) {
        this.defaultVal = defaultVal;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getComponentType() {
        return componentType;
    }

    public void setComponentType(Integer componentType) {
        this.componentType = componentType;
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
