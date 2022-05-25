package com.l1yp.model.db;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "process_model_definition")
public class ProcessModelDefinition {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private String processKey;

    private String title;

    private String codePrefix;

    private String codeTimePattern;

    private String codeJoiner;

    private String codeJoiner2;

    private String codeSuffix;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCodePrefix() {
        return codePrefix;
    }

    public void setCodePrefix(String codePrefix) {
        this.codePrefix = codePrefix;
    }

    public String getCodeTimePattern() {
        return codeTimePattern;
    }

    public void setCodeTimePattern(String codeTimePattern) {
        this.codeTimePattern = codeTimePattern;
    }

    public String getCodeJoiner() {
        return codeJoiner;
    }

    public void setCodeJoiner(String codeJoiner) {
        this.codeJoiner = codeJoiner;
    }

    public String getCodeJoiner2() {
        return codeJoiner2;
    }

    public void setCodeJoiner2(String codeJoiner2) {
        this.codeJoiner2 = codeJoiner2;
    }

    public String getCodeSuffix() {
        return codeSuffix;
    }

    public void setCodeSuffix(String codeSuffix) {
        this.codeSuffix = codeSuffix;
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
}
