package com.l1yp.service.task;

import com.l1yp.model.task.QuartzTriggerModel;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.Trigger.TriggerState;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class QuartzJobService {

    @Resource
    Scheduler scheduler;

    public List<QuartzTriggerModel> getTriggerList() {
        try {
            var result = new ArrayList<QuartzTriggerModel>();
            List<String> jobGroupNames = scheduler.getJobGroupNames();
            for (String jobGroupName : jobGroupNames) {
                Set<JobKey> jobKeys = scheduler.getJobKeys(GroupMatcher.<JobKey>groupEquals(jobGroupName));
                for (JobKey jobKey : jobKeys) {
                    JobDetail jobDetail = scheduler.getJobDetail(jobKey);

                    List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
                    for (Trigger trigger : triggers) {


                        var model = new QuartzTriggerModel();
                        TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
                        model.setStatus(triggerState.name());
                        model.setName(jobKey.getName());
                        model.setGroup(jobKey.getGroup());
                        model.setDescription(trigger.getDescription());
                        model.setCron(null);
                        model.setStartTime(trigger.getStartTime());
                        model.setLastTime(trigger.getPreviousFireTime());
                        model.setNextTime(trigger.getNextFireTime());
                        model.setEndTime(trigger.getEndTime());
                        model.setJobClazz(jobDetail.getJobClass().toGenericString());
                        model.setJobData(jobDetail.getJobDataMap());
                        if (trigger instanceof SimpleTrigger simpleTrigger) {
                            model.setTimesTriggered(simpleTrigger.getTimesTriggered());
                            model.setRepeatCount(simpleTrigger.getRepeatCount());
                            model.setRepeatInterval(simpleTrigger.getRepeatInterval());
                        } else if (trigger instanceof CronTrigger cronTrigger) {
                            model.setCron(cronTrigger.getCronExpression());
                            model.setCronTimeZone(cronTrigger.getTimeZone());
                        }
                        result.add(model);
                    }
                }
            }
            return result;
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }
    }


}
