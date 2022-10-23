package com.l1yp.service.workflow.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.l1yp.exception.VanException;
import com.l1yp.mapper.workflow.WorkflowFieldDefMapper;
import com.l1yp.mapper.workflow.WorkflowFieldRefMapper;
import com.l1yp.model.db.system.User;
import com.l1yp.model.db.workflow.model.FieldScope;
import com.l1yp.model.db.workflow.model.WorkflowFieldDef;
import com.l1yp.model.db.workflow.model.WorkflowFieldRef;
import com.l1yp.model.param.workflow.WorkflowFieldDefAddParam;
import com.l1yp.model.param.workflow.WorkflowFieldDefUpdateParam;
import com.l1yp.model.param.workflow.WorkflowFieldFindParam;
import com.l1yp.model.param.workflow.WorkflowFieldRefParam;
import com.l1yp.model.view.workflow.WorkflowFieldDefView;
import com.l1yp.service.workflow.IWorkflowFieldDefService;
import com.l1yp.util.BeanCopierUtil;
import com.l1yp.util.RequestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

@Service
public class WorkflowFieldDefServiceImpl extends ServiceImpl<WorkflowFieldDefMapper, WorkflowFieldDef> implements IWorkflowFieldDefService {

    @Resource
    WorkflowFieldRefMapper workflowFieldRefMapper;

    @Override
    public List<WorkflowFieldDefView> findFields(WorkflowFieldFindParam param) {
        LambdaQueryWrapper<WorkflowFieldDef> wrapper = Wrappers.lambdaQuery();
        if (param.getScope() != null) {
            wrapper.eq(WorkflowFieldDef::getScope, param.getScope());
            List<WorkflowFieldDef> workflowFieldDefs = getBaseMapper().selectList(wrapper);
            return workflowFieldDefs.stream().map(WorkflowFieldDef::toView).toList();
        }
        if (StringUtils.hasText(param.getWfKey())) {
            List<WorkflowFieldDef> workflowFieldDefs = getBaseMapper().selectWFFields(param);
            return workflowFieldDefs.stream().map(WorkflowFieldDef::toView).toList();
        }
        return Collections.emptyList();

    }

    @Override
    @Transactional
    public void addField(WorkflowFieldDefAddParam param) {
        User loginUser = RequestUtils.getLoginUser();

        WorkflowFieldDef workflowFieldDef = new WorkflowFieldDef();
        BeanCopierUtil.copy(param, workflowFieldDef);

        save(workflowFieldDef);
        if (StringUtils.hasText(param.getWfKey())) {
            WorkflowFieldRef workflowFieldRef = new WorkflowFieldRef();
            workflowFieldRef.setFieldId(workflowFieldDef.getId());
            workflowFieldRef.setWfKey(param.getWfKey());
            workflowFieldRefMapper.insert(workflowFieldRef);
        }

    }

    @Override
    @Transactional
    public void updateField(WorkflowFieldDefUpdateParam param) {
        User loginUser = RequestUtils.getLoginUser();
        WorkflowFieldDef workflowFieldDef = new WorkflowFieldDef();
        BeanCopierUtil.copy(param, workflowFieldDef);
        updateById(workflowFieldDef);

        // TODO: 更新引用字段的数据
    }

    @Override
    @Transactional
    public void deleteField(String fieldId) {
        WorkflowFieldDef workflowFieldDef = getById(fieldId);
        if (workflowFieldDef == null) {
            throw new VanException(400, "不存在的字段ID");
        }

        if (workflowFieldDef.getScope() == FieldScope.DEFAULT) {
            throw new VanException(400, "禁止删除默认字段");
        }

        if (workflowFieldDef.getScope() == FieldScope.GLOBAL) {
            Long count = workflowFieldRefMapper.selectCount(Wrappers.<WorkflowFieldRef>lambdaQuery().eq(WorkflowFieldRef::getFieldId, fieldId));
            if (count > 0) {
                throw new VanException(400, "删除全局字段前请先解绑与其关联的流程");
            }
        }

        // TODO: 查询相关视图 表单 等功能关联的字段

        // 最后删除字段
        removeById(fieldId);

        // 私有字段： 删除引用
        if (workflowFieldDef.getScope() == FieldScope.PRIVATE) {
            workflowFieldRefMapper.delete(Wrappers.<WorkflowFieldRef>lambdaQuery().eq(WorkflowFieldRef::getFieldId, fieldId));
        }



    }

    @Override
    @Transactional
    public void refGlobalField(WorkflowFieldRefParam param) {
        WorkflowFieldDef workflowFieldDef = getById(param.getFieldId());
        if (workflowFieldDef == null) {
            throw new VanException(400, "不存在的字段");
        }
        User loginUser = RequestUtils.getLoginUser();
        WorkflowFieldRef workflowFieldRef = new WorkflowFieldRef();
        workflowFieldRef.setFieldId(param.getFieldId());
        workflowFieldRef.setWfKey(param.getWfKey());
        workflowFieldRefMapper.insert(workflowFieldRef);
    }

    @Override
    @Transactional
    public void unrefGlobalField(WorkflowFieldRefParam param) {
        workflowFieldRefMapper.unrefField(param);
    }
}
