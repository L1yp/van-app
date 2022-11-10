package com.l1yp.model.view.modeling;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.page.PageScheme;

import java.util.Date;

public class ModelingPageView {

    private String id;

    private ModelingModule module;

    private String mkey;

    private String pageKey;

    private PageScheme pageScheme;

    private String updateBy;

    private Date updateTime;

    private String createBy;

    private Date createTime;

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

    public String getPageKey() {
        return pageKey;
    }

    public void setPageKey(String pageKey) {
        this.pageKey = pageKey;
    }

    public PageScheme getPageScheme() {
        return pageScheme;
    }

    public void setPageScheme(PageScheme pageScheme) {
        this.pageScheme = pageScheme;
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
}
