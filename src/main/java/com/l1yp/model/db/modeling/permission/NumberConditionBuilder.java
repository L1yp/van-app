package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.NumberFieldConditionModel;
import com.l1yp.model.db.system.SimpleDept;

import java.math.BigDecimal;
import java.util.List;

public class NumberConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem) {
        NumberFieldConditionModel numberFieldConditionModel = (NumberFieldConditionModel) blockItem.getValue();
        BigDecimal number = numberFieldConditionModel.getNumber();
        String fieldId = field.getId();
        int startIdx = args.size();
        args.add(number);
        sb.append(fieldId).append(" ").append(blockItem.getOperator().getSQLOperator());
        sb.append(" #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");

    }

}
