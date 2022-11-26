package com.l1yp.model.db.workflow.engine;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.l1yp.model.db.workflow.typehandler.TaskCommentMessageTypeHandler;

import java.util.Date;

@TableName(value = "ACT_HI_COMMENT", autoResultMap = true)
public class TaskComment {

    @TableId(value = "ID_")
    private String id;

    @TableField("TYPE_")
    private String type;

    @TableField("TIME_")
    private Date time;

    @TableField("USER_ID_")
    private String userId;

    @TableField("TASK_ID_")
    private String taskId;

    @TableField("PROC_INST_ID_")
    private String processInstanceId;

    @TableField("ACTION_")
    private String action;

    @TableField(value = "MESSAGE_", typeHandler = TaskCommentMessageTypeHandler.class)
    private TaskCommentMessage message;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public TaskCommentMessage getMessage() {
        return message;
    }

    public void setMessage(TaskCommentMessage message) {
        this.message = message;
    }

}
