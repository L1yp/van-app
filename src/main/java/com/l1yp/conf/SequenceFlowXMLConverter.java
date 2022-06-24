package com.l1yp.conf;

import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;

import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.converter.BaseBpmnXMLConverter;
import org.flowable.bpmn.converter.util.BpmnXMLUtil;
import org.flowable.bpmn.model.BaseElement;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.ExtensionAttribute;
import org.flowable.bpmn.model.SequenceFlow;

import java.util.Arrays;
import java.util.List;

/**
 * @author Tijs Rademakers
 * @enhance Lyp l1yp@qq.com
 * 支持sequenceFlow自定义属性
 */
public class SequenceFlowXMLConverter extends BaseBpmnXMLConverter {

    /** default attributes taken from bpmn spec and from extension namespace */
    protected static final List<ExtensionAttribute> defaultSequenceFlowAttributes = Arrays.asList(
            new ExtensionAttribute(ATTRIBUTE_FLOW_SOURCE_REF),
            new ExtensionAttribute(ATTRIBUTE_FLOW_TARGET_REF),
            new ExtensionAttribute(ATTRIBUTE_FLOW_SKIP_EXPRESSION)
    );

    @Override
    public Class<? extends BaseElement> getBpmnElementType() {
        return SequenceFlow.class;
    }

    @Override
    protected String getXMLElementName() {
        return ELEMENT_SEQUENCE_FLOW;
    }

    @Override
    protected BaseElement convertXMLToElement(XMLStreamReader xtr, BpmnModel model) throws Exception {
        SequenceFlow sequenceFlow = new SequenceFlow();
        BpmnXMLUtil.addXMLLocation(sequenceFlow, xtr);
        sequenceFlow.setSourceRef(xtr.getAttributeValue(null, ATTRIBUTE_FLOW_SOURCE_REF));
        sequenceFlow.setTargetRef(xtr.getAttributeValue(null, ATTRIBUTE_FLOW_TARGET_REF));
        sequenceFlow.setName(xtr.getAttributeValue(null, ATTRIBUTE_NAME));
        sequenceFlow.setSkipExpression(xtr.getAttributeValue(null, ATTRIBUTE_FLOW_SKIP_EXPRESSION));

        // FIXME: 允许自定义属性
        BpmnXMLUtil.addCustomAttributes(xtr, sequenceFlow, defaultElementAttributes, defaultActivityAttributes, defaultSequenceFlowAttributes);

        parseChildElements(getXMLElementName(), sequenceFlow, model, xtr);

        return sequenceFlow;
    }

    @Override
    protected void writeAdditionalAttributes(BaseElement element, BpmnModel model, XMLStreamWriter xtw) throws Exception {
        SequenceFlow sequenceFlow = (SequenceFlow) element;
        writeDefaultAttribute(ATTRIBUTE_FLOW_SOURCE_REF, sequenceFlow.getSourceRef(), xtw);
        writeDefaultAttribute(ATTRIBUTE_FLOW_TARGET_REF, sequenceFlow.getTargetRef(), xtw);
        if (StringUtils.isNotEmpty(sequenceFlow.getSkipExpression())) {
            writeDefaultAttribute(ATTRIBUTE_FLOW_SKIP_EXPRESSION, sequenceFlow.getSkipExpression(), xtw);
        }
    }

    @Override
    protected void writeAdditionalChildElements(BaseElement element, BpmnModel model, XMLStreamWriter xtw) throws Exception {
        SequenceFlow sequenceFlow = (SequenceFlow) element;

        if (StringUtils.isNotEmpty(sequenceFlow.getConditionExpression())) {
            xtw.writeStartElement(ELEMENT_FLOW_CONDITION);
            xtw.writeAttribute(XSI_PREFIX, XSI_NAMESPACE, "type", "tFormalExpression");
            xtw.writeCData(sequenceFlow.getConditionExpression());
            xtw.writeEndElement();
        }
    }
}
