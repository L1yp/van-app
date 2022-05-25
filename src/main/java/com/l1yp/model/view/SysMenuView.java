package com.l1yp.model.view;

import java.util.List;

public class SysMenuView {
    private Long id;

    private String title;

    private String name;

    private String route;

    private String icon;

    private Integer close;

    private Integer hidden;

    private Long pid;

    private List<SysMenuView> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getClose() {
        return close;
    }

    public void setClose(Integer close) {
        this.close = close;
    }

    public Integer getHidden() {
        return hidden;
    }

    public void setHidden(Integer hidden) {
        this.hidden = hidden;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public List<SysMenuView> getChildren() {
        return children;
    }

    public void setChildren(List<SysMenuView> children) {
        this.children = children;
    }

    public boolean getHasChildren() {
        return children != null && children.size() > 0;
    }
}
