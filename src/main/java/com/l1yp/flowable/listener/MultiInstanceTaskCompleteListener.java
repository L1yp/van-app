package com.l1yp.flowable.listener;

import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class MultiInstanceTaskCompleteListener implements TaskListener {

    private static final Logger log = LoggerFactory.getLogger(MultiInstanceTaskCompleteListener.class);

    @Override
    public void notify(DelegateTask delegateTask) {

        String outcome = (String) delegateTask.getTransientVariable("outcome");
        String userId = Authentication.getAuthenticatedUserId();
        log.info("task complete with taskId: {}, userId: {}, outcome: {}", delegateTask.getId(), userId, outcome);
        delegateTask.setVariable("MI:" + delegateTask.getId() + ":" + userId, outcome);
        // 统计 出口流线 次数
        String key = "$$$$" + outcome;
        Integer count = (Integer) delegateTask.getVariable(key);
        if (count == null) {
            delegateTask.setVariable(key, 1);
        } else {
            delegateTask.setVariable(key, count + 1);
        }

    }
}
