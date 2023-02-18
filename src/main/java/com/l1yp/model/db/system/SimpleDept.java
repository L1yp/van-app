package com.l1yp.model.db.system;

import java.util.List;

public class SimpleDept {

    private String id;

    private String pid;

    private List<SimpleDept> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public List<SimpleDept> getChildren() {
        return children;
    }

    public void setChildren(List<SimpleDept> children) {
        this.children = children;
    }
}
