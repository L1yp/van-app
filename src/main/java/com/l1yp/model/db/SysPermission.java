package com.l1yp.model.db;


import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import java.util.Date;

public class SysPermission {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private String ident;

    private Long ownerMenuId;

    private String updateBy;

    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdent() {
        return ident;
    }

    public void setIdent(String ident) {
        this.ident = ident;
    }

    public Long getOwnerMenuId() {
        return ownerMenuId;
    }

    public void setOwnerMenuId(Long ownerMenuId) {
        this.ownerMenuId = ownerMenuId;
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
}
