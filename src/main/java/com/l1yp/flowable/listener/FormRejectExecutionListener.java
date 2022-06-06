package com.l1yp.flowable.listener;

import com.l1yp.mapper.ProcessModelMapper;
import com.l1yp.util.ApplicationContextHelper;
import com.l1yp.util.ProcessModelUtil;
import org.flowable.bpmn.model.FieldExtension;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.delegate.ExecutionListener;
import org.flowable.engine.impl.el.FixedValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;

public class FormRejectExecutionListener implements ExecutionListener {

    private static final Logger log = LoggerFactory.getLogger(FormRejectExecutionListener.class);

    public FixedValue process_key;

    @Override
    public void notify(DelegateExecution execution) {
        String businessKey = execution.getProcessInstanceBusinessKey();
        Long wfId = Long.valueOf(businessKey);

        String tableName = ProcessModelUtil.getProcessModelTableName(process_key.getExpressionText());
        ProcessModelMapper processModelMapper = ApplicationContextHelper.getBean(ProcessModelMapper.class);
        Number count = (Number) processModelMapper.findFieldByWFID(tableName, wfId, "form_reject_count");
        processModelMapper.updateFields(tableName, wfId, null, Map.of("form_reject_count", count.intValue() + 1));

    }
}
