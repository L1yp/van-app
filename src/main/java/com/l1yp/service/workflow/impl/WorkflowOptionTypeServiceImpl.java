package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.WorkflowOptionTypeMapper;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.form.WorkflowOptionType;
import com.l1yp.model.db.workflow.form.WorkflowOptionValue;
import com.l1yp.model.db.workflow.model.WorkflowFieldDef;
import com.l1yp.model.param.workflow.WorkflowOptionTypeAddParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeFindParam;
import com.l1yp.model.param.workflow.WorkflowOptionTypeUpdateParam;
import com.l1yp.model.view.workflow.WorkflowOptionTypeView;
import com.l1yp.service.workflow.IWorkflowOptionTypeService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class WorkflowOptionTypeServiceImpl extends ServiceImpl<WorkflowOptionTypeMapper, WorkflowOptionType> implements IWorkflowOptionTypeService {


    @Resource
    WorkflowOptionValueServiceImpl workflowOptionValueService;

    @Override
    public List<WorkflowOptionTypeView> findTypes(WorkflowOptionTypeFindParam param) {
        if (param.getScope() != null) {
            LambdaQueryWrapper<WorkflowOptionType> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(WorkflowOptionType::getScope, param.getScope());
            List<WorkflowOptionType> workflowOptionTypes = getBaseMapper().selectList(wrapper);
            return workflowOptionTypes.stream().map(WorkflowOptionType::toView).toList();
        }

        if (StringUtils.hasText(param.getWfKey())) {
            LambdaQueryWrapper<WorkflowOptionType> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(WorkflowOptionType::getWfKey, param.getWfKey());
            List<WorkflowOptionType> workflowOptionTypes = getBaseMapper().selectList(wrapper);
            return workflowOptionTypes.stream().map(WorkflowOptionType::toView).toList();
        }

        return Collections.emptyList();
    }

    @Override
    @Transactional
    public void addType(WorkflowOptionTypeAddParam param) {
        WorkflowOptionType workflowOptionType = new WorkflowOptionType();
        BeanCopierUtil.copy(param, workflowOptionType);
        save(workflowOptionType);
    }

    @Override
    @Transactional
    public void updateType(WorkflowOptionTypeUpdateParam param) {
        WorkflowOptionType workflowOptionType = new WorkflowOptionType();
        BeanCopierUtil.copy(param, workflowOptionType);
        updateById(workflowOptionType);
    }

    @Override
    public void deleteType(String id) {
        int count = getBaseMapper().countOfOptionFieldRef(id);
        if (count > 0) {
            List<WorkflowFieldDef> workflowFieldDefs = getBaseMapper().selectOptionFieldRef(id);
            String strRefField = workflowFieldDefs.stream().map(it -> it.getLabel() + "(" + it.getField() + ")").collect(Collectors.joining("\n"));
            throw new VanException(500, "此数据源被以下字段引用: \n" + strRefField);
        }

        removeById(id);
        workflowOptionValueService.remove(Wrappers.<WorkflowOptionValue>lambdaQuery().eq(WorkflowOptionValue::getTypeId, id));

    }
}
