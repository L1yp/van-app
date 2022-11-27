package com.l1yp.flowable.validator;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.UserTask;
import org.flowable.validation.ValidationError;
import org.flowable.validation.validator.ValidatorImpl;

import java.util.List;

public class NoLabelUserTaskValidator extends ValidatorImpl {

    @Override
    public void validate(BpmnModel bpmnModel, List<ValidationError> errors) {
        Process process = bpmnModel.getMainProcess();
        List<UserTask> userTasks = process.getFlowElements().stream().filter(it -> it instanceof UserTask).map(it -> (UserTask) it).toList();

        for (UserTask userTask : userTasks) {
            if (StringUtils.isBlank(userTask.getName())) {
                addError(errors, "未填用户任务的名称", process, userTask, "名称必填");

            }
        }


    }
}
