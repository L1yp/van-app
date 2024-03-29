/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.l1yp.conf;

import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;

import org.flowable.bpmn.converter.BaseBpmnXMLConverter;
import org.flowable.bpmn.converter.util.BpmnXMLUtil;
import org.flowable.bpmn.model.BaseElement;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.EndEvent;

import java.util.Collections;

/**
 * @author Tijs Rademakers
 */
public class EndEventXMLConverter extends BaseBpmnXMLConverter {

    @Override
    public Class<? extends BaseElement> getBpmnElementType() {
        return EndEvent.class;
    }

    @Override
    protected String getXMLElementName() {
        return ELEMENT_EVENT_END;
    }

    @Override
    protected BaseElement convertXMLToElement(XMLStreamReader xtr, BpmnModel model) throws Exception {
        EndEvent endEvent = new EndEvent();
        BpmnXMLUtil.addXMLLocation(endEvent, xtr);
        parseChildElements(getXMLElementName(), endEvent, model, xtr);
        // FIXME: 允许自定义属性
        BpmnXMLUtil.addCustomAttributes(xtr, endEvent, defaultElementAttributes, defaultActivityAttributes, Collections.emptyList());


        return endEvent;
    }

    @Override
    protected void writeAdditionalAttributes(BaseElement element, BpmnModel model, XMLStreamWriter xtw) throws Exception {
    }

    @Override
    protected void writeAdditionalChildElements(BaseElement element, BpmnModel model, XMLStreamWriter xtw) throws Exception {
        EndEvent endEvent = (EndEvent) element;
        writeEventDefinitions(endEvent, endEvent.getEventDefinitions(), model, xtw);
    }
}
