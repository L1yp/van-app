package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingField.FieldModule;
import com.l1yp.model.db.modeling.ModelingView.Collation;

import java.util.Date;
import java.util.List;


public class ModelingViewView {
    private String id;

    private FieldModule module;

    private String mkey;

    private String name;

    private List<Collation> collation;

    private Integer sn;

    private Boolean status;

    private String updateBy;

    private Date updateTime;

    private String createBy;

    private Date createTime;

    private List<ModelingViewColumnView> columns;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public FieldModule getModule() {
        return module;
    }

    public void setModule(FieldModule module) {
        this.module = module;
    }

    public String getMkey() {
        return mkey;
    }

    public void setMkey(String mkey) {
        this.mkey = mkey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Collation> getCollation() {
        return collation;
    }

    public void setCollation(List<Collation> collation) {
        this.collation = collation;
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<ModelingViewColumnView> getColumns() {
        return columns;
    }

    public void setColumns(List<ModelingViewColumnView> columns) {
        this.columns = columns;
    }
}
