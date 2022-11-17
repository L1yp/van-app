package com.l1yp.model.param.modeling.page;

import com.l1yp.model.db.modeling.page.PageScheme;

public class ModelingPageUpdateParam {

    private String id;

    private String name;

    private PageScheme pageScheme;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
