package com.l1yp.model.view.workflow.instance;

import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.system.UserView;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class WorkflowInstanceDetailsResult {

    private ModelingPageView pageInfo;

    private LinkedHashMap<String, ModelingPageView> outcomes;

    private Map<String, Object> instanceInfo;

    private String xml;

    private Map<String, UserView> userMap;

    private List<?> historyActivities;

    private List<?> commentList;

    public ModelingPageView getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(ModelingPageView pageInfo) {
        this.pageInfo = pageInfo;
    }

    public LinkedHashMap<String, ModelingPageView> getOutcomes() {
        return outcomes;
    }

    public void setOutcomes(LinkedHashMap<String, ModelingPageView> outcomes) {
        this.outcomes = outcomes;
    }

    public Map<String, Object> getInstanceInfo() {
        return instanceInfo;
    }

    public void setInstanceInfo(Map<String, Object> instanceInfo) {
        this.instanceInfo = instanceInfo;
    }

    public String getXml() {
        return xml;
    }

    public void setXml(String xml) {
        this.xml = xml;
    }

    public Map<String, UserView> getUserMap() {
        return userMap;
    }

    public void setUserMap(Map<String, UserView> userMap) {
        this.userMap = userMap;
    }
}
