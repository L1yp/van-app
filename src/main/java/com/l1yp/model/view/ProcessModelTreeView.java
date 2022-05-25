package com.l1yp.model.view;

import java.util.Date;
import java.util.List;

public class ProcessModelTreeView {

    private Long id;

    private String processKey;

    private String title;

    private Integer state;

    private Date updateTime;

    private List<ProcessModelTreeView> children;

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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public List<ProcessModelTreeView> getChildren() {
        return children;
    }

    public void setChildren(List<ProcessModelTreeView> children) {
        this.children = children;
    }
}
