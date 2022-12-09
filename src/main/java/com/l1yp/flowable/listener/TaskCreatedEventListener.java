package com.l1yp.flowable.listener;

import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.service.system.impl.UserServiceImpl;
import com.l1yp.task.WorkflowMailSenderTask;
import org.apache.commons.lang3.StringUtils;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.common.engine.api.delegate.event.FlowableEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEventListener;
import org.flowable.common.engine.api.delegate.event.FlowableEventType;
import org.flowable.common.engine.impl.event.FlowableEntityEventImpl;
import org.flowable.engine.impl.event.logger.handler.TaskCreatedEventHandler;
import org.flowable.task.service.impl.persistence.entity.TaskEntityImpl;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.SimpleTrigger;
import org.quartz.TriggerBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Set;

@Component
public class TaskCreatedEventListener implements FlowableEventListener {

    private static final Logger log = LoggerFactory.getLogger(ProcessCompletedEventListener.class);

    @Resource
    UserServiceImpl userService;

    @Resource
    Scheduler scheduler;

    @Override
    public void onEvent(FlowableEvent event) {
//        if (event instanceof FlowableEntityEventImpl entityEvent) {
//            TaskEntityImpl entity = (TaskEntityImpl) entityEvent.getEntity();
//
//            String processDefinitionId = entityEvent.getProcessDefinitionId();
//            String processKey = StringUtils.substringBefore(processDefinitionId, ":");
//            String processInstanceId = entityEvent.getProcessInstanceId();
//
//            String assignee = entity.getAssignee();
//            User user = userService.findById(assignee);
//            if (user == null) {
//                return;
//            }
//
//            String taskDefinitionKey = entity.getTaskDefinitionKey();
//
//            String email = user.getEmail();
//
//            JobDetail jobDetail = JobBuilder.newJob()
//                    .ofType(WorkflowMailSenderTask.class)
//                    .usingJobData("key", processKey)
//                    .usingJobData("processInstanceId", processInstanceId)
//                    .usingJobData("taskDefinitionKey", taskDefinitionKey)
//                    .usingJobData("targetUserId", assignee)
//                    .usingJobData("email", email)
//                    .withDescription("邮件通知")
//                    .build();
//
//            SimpleTrigger simpleTrigger = TriggerBuilder.newTrigger()
//                    .withSchedule(
//                            SimpleScheduleBuilder.simpleSchedule().repeatForever().withIntervalInSeconds(30)
//                    )
//                    .withIdentity("half-day", "fixed-interval")
//                    .startNow()
//                    .withDescription("send email")
//                    .build();
//
//            try {
//                scheduler.scheduleJob(jobDetail, simpleTrigger);
//            } catch (SchedulerException e) {
//                log.error("schedule job", e);
//                throw new RuntimeException(e);
//            }
//
//
//        }



        log.info("onEvent: {}", event);
    }

    @Override
    public boolean isFailOnException() {
        return false;
    }

    @Override
    public boolean isFireOnTransactionLifecycleEvent() {
        return false;
    }

    @Override
    public String getOnTransaction() {
        return null;
    }

    @Override
    public Collection<? extends FlowableEventType> getTypes() {
        return Set.of(FlowableEngineEventType.TASK_CREATED);
    }
}
