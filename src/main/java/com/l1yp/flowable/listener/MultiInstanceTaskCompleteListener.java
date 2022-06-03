package com.l1yp.flowable.listener;

import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Component;

@Component
public class MultiInstanceTaskCompleteListener implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {

        String outcome = (String) delegateTask.getTransientVariable("outcome");
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
