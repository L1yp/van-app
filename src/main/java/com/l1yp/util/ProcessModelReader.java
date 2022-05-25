package com.l1yp.util;

import com.l1yp.mapper.ProcessModelMapper;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component("psr")
public class ProcessModelReader {

    @Resource
    ProcessModelMapper processModelMapper;

    public Object read(String processKey, String field, DelegateExecution execution) {
        String processInstanceId = execution.getProcessInstanceId();
        return processModelMapper.findField("wf_" + processKey, processInstanceId, field);
    }

    public Object read(String processKey, String field, DelegateTask task) {
        String processInstanceId = task.getProcessInstanceId();
        return processModelMapper.findField("wf_" + processKey, processInstanceId, field);
    }

}
