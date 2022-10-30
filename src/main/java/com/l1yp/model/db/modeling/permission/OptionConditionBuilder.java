package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.OptionConditionModel;
import com.l1yp.model.db.system.DeptPlain;

import java.util.List;

public class OptionConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem blockItem) {
        OptionConditionModel deptConditionModel = null;
        String fieldId = field.getId();
        appendRefBlock(sb, formPrefix, fieldId, deptConditionModel.getSelected(), args);
    }

}
