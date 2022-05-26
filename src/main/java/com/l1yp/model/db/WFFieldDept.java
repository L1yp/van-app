package com.l1yp.model.db;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "wf_field_dept")
public class WFFieldDept {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private String processKey;

    private Long wfId;

    private String processInstanceId;

    private Long fieldId;

    private Long deptId;

    private String updateBy;

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

    public Long getWfId() {
        return wfId;
    }

    public void setWfId(Long wfId) {
        this.wfId = wfId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

}
