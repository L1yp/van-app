package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.mapper.workflow.WorkflowOptionValueMapper;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.form.WorkflowOptionValue;
import com.l1yp.model.param.workflow.WorkflowOptionValueAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionValueUpdateParam;
import com.l1yp.model.view.workflow.WorkflowOptionValueView;
import com.l1yp.service.workflow.IWorkflowOptionValueService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WorkflowOptionValueServiceImpl extends ServiceImpl<WorkflowOptionValueMapper, WorkflowOptionValue> implements IWorkflowOptionValueService {


    @Override
    public List<WorkflowOptionValueView> findValues(WorkflowOptionValueFindParam param) {
        List<WorkflowOptionValue> workflowOptionValues = getBaseMapper().selectList(Wrappers.<WorkflowOptionValue>lambdaQuery().eq(WorkflowOptionValue::getTypeId, param.getTypeId()));
        return workflowOptionValues.stream().map(WorkflowOptionValue::toView).toList();
    }

    @Override
    @Transactional
    public void addValue(WorkflowOptionValueAddParam param) {
        User loginUser = RequestUtils.getLoginUser();
        WorkflowOptionValue workflowOptionValue = new WorkflowOptionValue();
        BeanCopierUtil.copy(param, workflowOptionValue);
        save(workflowOptionValue);

    }

    @Override
    @Transactional
    public void updateValue(WorkflowOptionValueUpdateParam param) {
        User loginUser = RequestUtils.getLoginUser();
        WorkflowOptionValue workflowOptionValue = new WorkflowOptionValue();
        BeanCopierUtil.copy(param, workflowOptionValue);
        updateById(workflowOptionValue);
    }
}
