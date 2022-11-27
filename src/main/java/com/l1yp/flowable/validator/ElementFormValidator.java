package com.l1yp.flowable.validator;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.model.view.modeling.ModelingPageView;
import com.l1yp.service.modeling.impl.ModelingPageServiceImpl;
import com.l1yp.util.ApplicationContextHelper;
import org.flowable.bpmn.constants.BpmnXMLConstants;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.EndEvent;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.SequenceFlow;
import org.flowable.bpmn.model.StartEvent;
import org.flowable.bpmn.model.UserTask;
import org.flowable.validation.ValidationError;
import org.flowable.validation.validator.ValidatorImpl;

import java.util.Collection;
import java.util.List;

public class ElementFormValidator extends ValidatorImpl {

    @Override
    public void validate(BpmnModel bpmnModel, List<ValidationError> errors) {
        ModelingPageServiceImpl pageService = ApplicationContextHelper.getBean(ModelingPageServiceImpl.class);

        Process process = bpmnModel.getMainProcess();

        Collection<FlowElement> flowElements = process.getFlowElements();
        List<StartEvent> startEvents = flowElements.stream().filter(it -> it instanceof StartEvent).map(it -> (StartEvent) it).toList();
        if (CollectionUtils.isEmpty(startEvents)) {
            addError(errors, "无启动节点", process, "无启动节点");
            return;
        }

        if (startEvents.size() > 1) {
            addError(errors, "启动节点有且只能有一个", process, "启动节点有且只能有一个");
            return;
        }

        var startEvent = startEvents.get(0);
        if (StringUtils.isBlank(startEvent.getFormKey())) {
            addError(errors, "启动节点未配置表单", startEvent, process, "启动节点必须配置表单");
        } else {
            ModelingPageView page = pageService.getPageById(startEvent.getFormKey());
            if (page == null) {
                addError(errors, "绑定的表单页面不存在", startEvent, process, "绑定的表单页面不存在");
            }
        }

        List<EndEvent> endEvents = flowElements.stream().filter(it -> it instanceof EndEvent).map(it -> (EndEvent) it).toList();
        for (EndEvent endEvent : endEvents) {
            String formKey = endEvent.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "formKey");
            if (StringUtils.isNotBlank(formKey)) {
                ModelingPageView page = pageService.getPageById(formKey);
                if (page == null) {
                    addError(errors, "绑定的表单页面不存在", endEvent, process, "绑定的表单页面不存在");
                }
            }
        }

        List<SequenceFlow> sequenceFlows = flowElements.stream().filter(it -> it instanceof SequenceFlow).map(it -> (SequenceFlow) it).toList();
        for (SequenceFlow sequenceFlow : sequenceFlows) {
            String formKey = sequenceFlow.getAttributeValue(BpmnXMLConstants.FLOWABLE_EXTENSIONS_NAMESPACE, "formKey");
            if (StringUtils.isNotBlank(formKey)) {
                ModelingPageView page = pageService.getPageById(formKey);
                if (page == null) {
                    addError(errors, "绑定的表单页面不存在", sequenceFlow, process, "绑定的表单页面不存在");
                }
            }
        }

        List<UserTask> userTasks = flowElements.stream().filter(it -> it instanceof UserTask).map(it -> (UserTask) it).toList();
        if (CollectionUtils.isNotEmpty(userTasks)) {
            for (UserTask userTask : userTasks) {
                if (StringUtils.isBlank(userTask.getFormKey())) {
                    addError(errors, "未配置表单", userTask, process, "必须配置表单");
                } else {
                    ModelingPageView page = pageService.getPageById(userTask.getFormKey());
                    if (page == null) {
                        addError(errors, "绑定的表单页面不存在", userTask, process, "绑定的表单页面不存在");
                    }
                }
            }
        }


    }
}
