package com.l1yp.util;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.db.workflow.model.WorkflowTypeDef;
import com.l1yp.service.modeling.impl.ModelingFieldServiceImpl;
import com.l1yp.service.workflow.def.impl.WorkflowTypeDefServiceImpl;
import org.flowable.engine.delegate.DelegateExecution;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Component("psr")
public class ProcessModelReader {

    @Resource
    ModelingFieldServiceImpl modelingFieldService;

    @Resource
    WorkflowTypeDefServiceImpl workflowTypeDefService;

    public String read(DelegateExecution execution, String processKey, String fields) throws Exception {
        String processInstanceId = execution.getProcessInstanceId();
        List<String> result = readExecutionField(processKey, fields, processInstanceId);
        if (CollectionUtils.isEmpty(result)) {
            return null;
        }
        return result.get(0);
    }

    public List<String> readList(DelegateExecution execution, String processKey, String fields) throws Exception {
        String processInstanceId = execution.getProcessInstanceId();
        return readExecutionField(processKey, fields, processInstanceId);
    }


    private List<String> readExecutionField(String processKey, String fields, String processInstanceId) throws NoSuchFieldException {
        WorkflowTypeDef workflowType = workflowTypeDefService.getWorkflowTypeDefByKey(processKey);
        if (workflowType == null) {
            throw new RuntimeException("流程标识不存在");
        }
        List<ModelingField> modelFields = modelingFieldService.findModelFields(ModelingModule.WORKFLOW, processKey);
        Set<String> fieldSet = modelFields.stream().map(ModelingField::getField).collect(Collectors.toSet());

        List<String> fieldList = new ArrayList<>();
        if (fields.contains(",")) {
            fieldList = Arrays.asList(fields.split(","));
        } else {
            fieldList.add(fields);
        }

        List<String> validFieldList = fieldList.stream().filter(fieldSet::contains).toList();
        String strFields = validFieldList.stream().map(it -> String.format("`%s`", it)).collect(Collectors.joining(","));
        String tableName = WorkflowTypeDef.buildEntityTableName(processKey);
        Map<String, Object> instanceInfo = workflowTypeDefService.getBaseMapper().getInstanceFieldsByInstanceId(tableName, processInstanceId, strFields);
        NumberUtil.transformBigIntToString(instanceInfo);
        List<String> result = new ArrayList<>();
        Set<String> valueList = new HashSet<>();
        for (String field : validFieldList) {
            String value = (String) instanceInfo.get(field);
            if (StringUtils.isBlank(value)) {
                continue;
            }
            if (value.contains(",")) {
                String[] fieldValues = value.split(",");
                for (String fieldValue : fieldValues) {
                    if (!valueList.contains(fieldValue)) {
                        result.add(fieldValue);
                        valueList.add(fieldValue);
                    }
                }
            } else {
                if (!valueList.contains(value)) {
                    result.add(value);
                    valueList.add(value);
                }
            }
        }

        return result;
    }

}