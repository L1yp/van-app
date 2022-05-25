package com.l1yp.util;

import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.FormProperty;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.engine.impl.util.ProcessDefinitionUtil;

import java.util.List;

public class FlowableUtil {

    public static String readFormKeyByProcessDefinitionId(String processDefinitionId) {
        org.flowable.bpmn.model.Process process = ProcessDefinitionUtil.getProcess(processDefinitionId);
        if (process == null) {
            return null;
        }
        FlowElement initialFlowElement = process.getInitialFlowElement();
        if (initialFlowElement instanceof StartEvent) {

            StartEvent startEvent = (StartEvent) initialFlowElement;
            return startEvent.getFormKey();
        }
        return null;
    }

    public static StartEvent readStartEventByProcessDefinitionId(String processDefinitionId) {
        org.flowable.bpmn.model.Process process = ProcessDefinitionUtil.getProcess(processDefinitionId);
        if (process == null) {
            return null;
        }
        FlowElement initialFlowElement = process.getInitialFlowElement();
        if (initialFlowElement instanceof StartEvent) {
            return (StartEvent) initialFlowElement;
        }
        return null;
    }

}
