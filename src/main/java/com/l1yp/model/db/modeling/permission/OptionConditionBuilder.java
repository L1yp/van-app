package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.OptionFieldConditionModel;
import com.l1yp.model.db.system.SimpleDept;

import java.util.List;

public class OptionConditionBuilder implements IFieldCondition {

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem) {
        OptionFieldConditionModel optionFieldConditionModel = (OptionFieldConditionModel) blockItem.getValue();
        String fieldId = field.getId();
        appendRefBlock(sb, formPrefix, fieldId, optionFieldConditionModel.getOptionValueIdList(), args);
    }

}
