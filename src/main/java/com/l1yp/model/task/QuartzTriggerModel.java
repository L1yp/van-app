package com.l1yp.model.task;

import org.quartz.JobDataMap;

import java.util.Date;
import java.util.TimeZone;

public class QuartzTriggerModel {

    private String name;
    private String group;
    private String description;

    private String cron;

    private TimeZone cronTimeZone;

    private String cronSummary;

    private Date nextTime;

    private Date lastTime;

    private Date startTime;

    private Date endTime;

    private int repeatCount;

    private long repeatInterval;

    private int timesTriggered;

    private String jobClazz;

    private JobDataMap jobData;

    private String status;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron;
    }

    public TimeZone getCronTimeZone() {
        return cronTimeZone;
    }

    public void setCronTimeZone(TimeZone cronTimeZone) {
        this.cronTimeZone = cronTimeZone;
    }

    public String getCronSummary() {
        return cronSummary;
    }

    public void setCronSummary(String cronSummary) {
        this.cronSummary = cronSummary;
    }

    public Date getNextTime() {
        return nextTime;
    }

    public void setNextTime(Date nextTime) {
        this.nextTime = nextTime;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRepeatCount() {
        return repeatCount;
    }

    public void setRepeatCount(int repeatCount) {
        this.repeatCount = repeatCount;
    }

    public long getRepeatInterval() {
        return repeatInterval;
    }

    public void setRepeatInterval(long repeatInterval) {
        this.repeatInterval = repeatInterval;
    }

    public int getTimesTriggered() {
        return timesTriggered;
    }

    public void setTimesTriggered(int timesTriggered) {
        this.timesTriggered = timesTriggered;
    }

    public String getJobClazz() {
        return jobClazz;
    }

    public void setJobClazz(String jobClazz) {
        this.jobClazz = jobClazz;
    }

    public JobDataMap getJobData() {
        return jobData;
    }

    public void setJobData(JobDataMap jobData) {
        this.jobData = jobData;
    }
}
