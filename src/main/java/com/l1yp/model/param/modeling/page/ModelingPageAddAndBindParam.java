package com.l1yp.model.param.modeling.page;

import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.modeling.page.PageScheme;

public class ModelingPageAddAndBindParam {

    private ModelingModule module;

    private String mkey;

    private String pageKey;

    private String pageId;

    private String name;

    private PageScheme pageScheme;

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

    public String getPageId() {
        return pageId;
    }

    public void setPageId(String pageId) {
        this.pageId = pageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public PageScheme getPageScheme() {
        return pageScheme;
    }

    public void setPageScheme(PageScheme pageScheme) {
        this.pageScheme = pageScheme;
    }
}
