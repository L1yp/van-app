package com.l1yp.model.db;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "process_model_page_scheme")
public class ProcessModelPageScheme {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private Long processModelPageId;

    private String device; // h5/pad/pc

    private Long fieldId;
    private String fieldName;
    private String fieldLabel;

    private ProcessFieldDefinition field;

    private Integer orderNo;

    private Integer span;

    private Integer writeable;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProcessModelPageId() {
        return processModelPageId;
    }

    public void setProcessModelPageId(Long processModelPageId) {
        this.processModelPageId = processModelPageId;
    }

    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
    }

    public String getFieldLabel() {
        return fieldLabel;
    }

    public void setFieldLabel(String fieldLabel) {
        this.fieldLabel = fieldLabel;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getSpan() {
        return span;
    }

    public void setSpan(Integer span) {
        this.span = span;
    }

    public Integer getWriteable() {
        return writeable;
    }

    public void setWriteable(Integer writeable) {
        this.writeable = writeable;
    }

    public ProcessFieldDefinition getField() {
        return field;
    }

    public void setField(ProcessFieldDefinition field) {
        this.field = field;
    }
}
