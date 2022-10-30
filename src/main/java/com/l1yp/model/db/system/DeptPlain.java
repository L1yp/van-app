package com.l1yp.model.db.system;

import java.util.List;

public class DeptPlain {

    private String id;

    private String pid;

    private List<DeptPlain> children;

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

    public List<DeptPlain> getChildren() {
        return children;
    }

    public void setChildren(List<DeptPlain> children) {
        this.children = children;
    }
}
