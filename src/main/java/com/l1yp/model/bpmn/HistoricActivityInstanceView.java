package com.l1yp.model.bpmn;

import com.l1yp.model.view.SysUserView;

import java.util.Date;
import java.util.Map;

public class HistoricActivityInstanceView {
    public String id;
    public String activityId; // sequenceFlow.id
    public String activityName;
    public String activityType;
    public String executionId;
    public String processInstanceId;
    public String processDefinitionId;
    public Long durationInMillis;
    public Date startTime;
    public Date endTime;
    public String deleteReason;
    public SysUserView assignee;
    public String taskId;
    public String calledProcessInstanceId;
    public Map<String, Object> variables;

}
