package com.l1yp.model.view;

import java.util.Date;
import java.util.List;

/**
 * 2022/2/19 Created by 𝑳𝒚𝒑(l1yp@qq.com), 部门
 */
public class SysDeptView {

    private Long id;

    private String title;

    private String simpleName;

    private String description;

    private String ident;

    private Integer orderNo;

    private Long pid;

    private Long bizPid;

    private Long owner;

    private SysUserView ownerInfo;

    private Long assistant;

    private String phone;

    private String officeLocation;

    private String address;

    private String updateBy;

    private Integer status;

    private Date updateTime;

    private Date createTime;

    private List<SysDeptView> children;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIdent() {
        return ident;
    }

    public void setIdent(String ident) {
        this.ident = ident;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getOwner() {
        return owner;
    }

    public void setOwner(Long owner) {
        this.owner = owner;
    }

    public SysUserView getOwnerInfo() {
        return ownerInfo;
    }

    public void setOwnerInfo(SysUserView ownerInfo) {
        this.ownerInfo = ownerInfo;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public List<SysDeptView> getChildren() {
        return children;
    }

    public void setChildren(List<SysDeptView> children) {
        this.children = children;
    }

    public boolean getHasChildren() {
        return children != null && children.size() > 0;
    }

    public String getSimpleName() {
        return simpleName;
    }

    public void setSimpleName(String simpleName) {
        this.simpleName = simpleName;
    }

    public Long getBizPid() {
        return bizPid;
    }

    public void setBizPid(Long bizPid) {
        this.bizPid = bizPid;
    }

    public Long getAssistant() {
        return assistant;
    }

    public void setAssistant(Long assistant) {
        this.assistant = assistant;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOfficeLocation() {
        return officeLocation;
    }

    public void setOfficeLocation(String officeLocation) {
        this.officeLocation = officeLocation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
