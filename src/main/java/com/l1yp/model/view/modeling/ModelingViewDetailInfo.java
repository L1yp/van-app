package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.ModelingView.Collation;
import com.l1yp.model.view.system.UserView;

import java.util.Date;
import java.util.List;

public class ModelingViewDetailInfo {

    private String id;

    private ModelingModule module;

    private String mkey;

    private String name;

    private List<Collation> collation;

    private Integer sn;

    private Boolean status;

    private UserView updateBy;

    private Date updateTime;

    private UserView createBy;

    private Date createTime;

    private List<ModelingViewColumnView> columns;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ModelingModule getModule() {
        return module;
    }

    public void setModule(ModelingModule module) {
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

    public UserView getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(UserView updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public UserView getCreateBy() {
        return createBy;
    }

    public void setCreateBy(UserView createBy) {
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
