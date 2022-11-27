package com.l1yp.flowable.validator;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.UserTask;
import org.flowable.validation.ValidationError;
import org.flowable.validation.validator.ValidatorImpl;

import java.util.List;

public class MultiInstanceOutcomeValidator extends ValidatorImpl {
    @Override
    public void validate(BpmnModel bpmnModel, List<ValidationError> errors) {
        Process process = bpmnModel.getMainProcess();

        List<UserTask> userTasks = process.getFlowElements().stream()
                .filter(it -> it instanceof UserTask userTask && userTask.hasMultiInstanceLoopCharacteristics())
                .map(it -> (UserTask) it).toList();

        for (UserTask userTask : userTasks) {
            List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
            if (outgoingFlows == null || outgoingFlows.size() < 2) {
                addError(errors, "会签节点出口数量小于2", process, userTask, "会签节点出口必须大于2");
            }
        }


    }
}
