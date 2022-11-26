package com.l1yp.model.view.workflow.instance;

import com.l1yp.model.db.workflow.engine.TaskComment;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.model.view.system.UserView;

import java.util.List;
import java.util.Map;

public class WorkflowInstanceDetailsResult {

    private ModelingPageView pageInfo;

    private List<WorkflowOutcomeInfo> outcomes;

    private Map<String, Object> instanceInfo;

    private String xml;

    private Map<String, UserView> userMap;

    private List<WorkflowActivityInfo> activityList;

    private List<TaskComment> commentList;

    private String taskId;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public ModelingPageView getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(ModelingPageView pageInfo) {
        this.pageInfo = pageInfo;
    }

    public List<WorkflowOutcomeInfo> getOutcomes() {
        return outcomes;
    }

    public void setOutcomes(List<WorkflowOutcomeInfo> outcomes) {
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

    public List<TaskComment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<TaskComment> commentList) {
        this.commentList = commentList;
    }

    public List<WorkflowActivityInfo> getActivityList() {
        return activityList;
    }

    public void setActivityList(List<WorkflowActivityInfo> activityList) {
        this.activityList = activityList;
    }
}
