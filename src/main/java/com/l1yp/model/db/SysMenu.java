package com.l1yp.model.db;

import com.l1yp.model.view.SysMenuView;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Date;

@Table(name = "sys_menu")
public class SysMenu {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long id;

    private String title;

    private String name;

    private String route;

    private String icon;

    private Integer close;

    private Integer hidden;

    private Long pid;

    private String createBy;

    private String updateBy;

    private Date updateTime;

    private Date createTime;


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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public SysMenuView convertToView() {
        SysMenuView view = new SysMenuView();
        view.setId(id);
        view.setTitle(title);
        view.setName(name);
        view.setRoute(route);
        view.setIcon(icon);
        view.setClose(close);
        view.setHidden(hidden);
        view.setPid(pid);
        view.setChildren(new ArrayList<>());
        return view;
    }

}
