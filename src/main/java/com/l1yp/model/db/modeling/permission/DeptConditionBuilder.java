package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.DeptConditionModel;
import com.l1yp.model.db.system.DeptPlain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DeptConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem blockItem) {
        DeptConditionModel deptConditionModel = null;
        String dptId = deptConditionModel.getDptId();
        List<String> candidateIds = new ArrayList<>();

        if (dptId.equals(DeptConditionModel.SELF_DPT)) {
            candidateIds.addAll(selfDptIds);
        } else {
            candidateIds.add(dptId);
        }

        if (deptConditionModel.isContainerChildren()) {
            List<String> children;
            if (dptId.equals(DeptConditionModel.SELF_DPT)) {
                children = getDepartmentChildren(dptTree, selfDptIds);
            } else {
                children = getDepartmentChildren(dptTree, Collections.singletonList(dptId));
            }
            candidateIds.addAll(children);
        }

        String fieldId = field.getId();
        appendRefBlock(sb, formPrefix, fieldId, candidateIds, args);
    }
}
