package com.l1yp.model.param.permission;

public class PermissionUpdateParam {

    private Long id;

    private String ident;

    private Long ownerMenuId;

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
}
