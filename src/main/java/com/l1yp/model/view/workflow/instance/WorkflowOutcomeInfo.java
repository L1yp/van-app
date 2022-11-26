package com.l1yp.model.view.workflow.instance;

import com.l1yp.model.view.modeling.ModelingPageView;

public class WorkflowOutcomeInfo {

    private String name;

    private ModelingPageView pageInfo;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ModelingPageView getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(ModelingPageView pageInfo) {
        this.pageInfo = pageInfo;
    }
}
