package com.l1yp.model.db.modeling.permission;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.DeptFieldConditionModel;
import com.l1yp.model.db.system.SimpleDept;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DeptConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem) {
        DeptFieldConditionModel deptFieldConditionModel = (DeptFieldConditionModel) blockItem.getValue();
        String dptId = deptFieldConditionModel.getDeptId();
        List<String> candidateIds = new ArrayList<>();

        if (dptId.equals(DeptFieldConditionModel.SELF_DPT)) {
            candidateIds.addAll(selfDptIds);
        } else {
            candidateIds.add(dptId);
        }

        if (deptFieldConditionModel.isCascader()) {
            List<String> children;
            if (dptId.equals(DeptFieldConditionModel.SELF_DPT)) {
                children = getDepartmentChildren(dptTree, selfDptIds);
            } else {
                children = getDepartmentChildren(dptTree, Collections.singletonList(dptId));
            }
            candidateIds.addAll(children);
        }

        String fieldName = field.getField();
        if (CollectionUtils.isNotEmpty(candidateIds)) {
            appendRefBlock(sb, formPrefix, fieldName, candidateIds, args);
        }
    }
}
