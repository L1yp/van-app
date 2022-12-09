package com.l1yp.task;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class WorkflowMailSenderTask extends QuartzJobBean {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
        String email = jobDataMap.getString("email");
        log.info("[start] emailTask: [{}]", email);
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        log.info("[end] emailTask: [{}]", email);
    }


}
