package com.l1yp.flowable.validator;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.UserTask;
import org.flowable.validation.ValidationError;
import org.flowable.validation.validator.ValidatorImpl;

import java.util.List;
import java.util.Objects;

public class WorkflowOutcomeValidator extends ValidatorImpl {

    @Override
    public void validate(BpmnModel bpmnModel, List<ValidationError> errors) {
        Process process = bpmnModel.getMainProcess();
        List<UserTask> userTasks = process.getFlowElements().stream()
                .filter(it -> it instanceof UserTask)
                .map(it -> (UserTask) it)
                .filter(it -> it.getOutgoingFlows() != null && it.getOutgoingFlows().size() > 1)
                .toList();

        for (UserTask userTask : userTasks) {
            List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
            for (SequenceFlow outgoingFlow : outgoingFlows) {
                if (StringUtils.isBlank(outgoingFlow.getConditionExpression())) {
                    addError(errors, "非条件流", process, outgoingFlow, userTask, "多个出口必须是条件流线");
                }
            }
        }


    }
}
