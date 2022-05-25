package com.l1yp.model.param.dict.config;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

public class DictValueAddParam {

    @NotBlank
    private String scope;

    @NotBlank
    private String ident;

    @NotBlank
    private String label;

    @Min(0)
    private Long val;

    @Min(1)
    private Integer orderNo;

    @Min(0)
    private Integer status;

    private String remark;

    @Min(0)
    private Long pid;

    private String meta;

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getIdent() {
        return ident;
    }

    public void setIdent(String ident) {
        this.ident = ident;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Long getVal() {
        return val;
    }

    public void setVal(Long val) {
        this.val = val;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }
}
