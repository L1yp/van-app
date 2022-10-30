package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.BlockItem;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.NumberConditionModel;
import com.l1yp.model.db.system.DeptPlain;
import java.math.BigDecimal;
import java.util.List;

public class NumberConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<DeptPlain> dptTree, List<String> selfDptIds, List<Object> args, BlockItem blockItem) {
        NumberConditionModel strConditionModel = null;
        BigDecimal value = new BigDecimal(strConditionModel.getValue());
        String fieldId = field.getId();
        int startIdx = args.size();
        args.add(value);
        sb.append(fieldId).append(" = #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");

    }

}
