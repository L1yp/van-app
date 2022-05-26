package com.l1yp.util;

import com.l1yp.conf.constants.process.ProcessConstants;
import com.l1yp.mapper.*;
import com.l1yp.model.db.ProcessFieldDefinition;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.task.service.delegate.DelegateTask;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Component("psr")
public class ProcessModelReader {

    @Resource
    ProcessModelMapper processModelMapper;

    @Resource
    ProcessFieldDefinitionMapper processFieldDefinitionMapper;

    @Resource
    WFFieldDeptMapper wfFieldDeptMapper;
    @Resource
    WFFieldDictMapper wfFieldDictMapper;
    @Resource
    WFFieldUserMapper wfFieldUserMapper;

    private static final Set<Integer> multiRefIdSet = new HashSet<>(Arrays.asList(ProcessConstants.ComponentType.MULTI_DICT, ProcessConstants.ComponentType.MULTI_DEPT, ProcessConstants.ComponentType.MULTI_USER));

    public Object read(String processKey, String field, DelegateExecution execution) throws Exception {
        return readField(processKey, field, execution.getProcessInstanceId());
    }

    public Object read(String processKey, String field, DelegateTask task) throws Exception {
        return readField(processKey, field, task.getProcessInstanceId());
    }

    private Object readField(String processKey, String field, String processInstanceId) throws NoSuchFieldException {
        List<ProcessFieldDefinition> fields = processFieldDefinitionMapper.selectFieldsByProcessKey(processKey);
        Map<String, ProcessFieldDefinition> fieldDefinitionMap = fields.stream().collect(Collectors.toMap(ProcessFieldDefinition::getName, it -> it));

        ProcessFieldDefinition processFieldDefinition = fieldDefinitionMap.get(field);
        if (processFieldDefinition == null) {
            throw new NoSuchFieldException(String.format("ProcessModelReader.read(%s, %s, %s)", processKey, field, processInstanceId));
        }

        if (multiRefIdSet.contains(processFieldDefinition.getComponentType())) {
            if (processFieldDefinition.getComponentType() == ProcessConstants.ComponentType.MULTI_DEPT) {
                return wfFieldDeptMapper.listDeptIdByProcessInstanceId(processKey, processInstanceId);
            }
            else if (processFieldDefinition.getComponentType() == ProcessConstants.ComponentType.MULTI_DICT) {
                return wfFieldDictMapper.listDictIdByProcessInstanceId(processKey, processInstanceId);
            }
            else if (processFieldDefinition.getComponentType() == ProcessConstants.ComponentType.MULTI_USER) {
                return wfFieldUserMapper.listDictIdByProcessInstanceId(processKey, processInstanceId);
            }
        }

        return processModelMapper.findField("wf_" + processKey, processInstanceId, field);
    }

}
