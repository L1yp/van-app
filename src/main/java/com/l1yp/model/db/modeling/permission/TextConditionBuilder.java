package com.l1yp.model.db.modeling.permission;

import com.l1yp.model.db.modeling.ModelingField;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.ConditionOperator;
import com.l1yp.model.db.modeling.permission.BlockExpressionModel.TextFieldConditionModel;
import com.l1yp.model.db.system.SimpleDept;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class TextConditionBuilder implements IFieldCondition {

    private final Logger log = LoggerFactory.getLogger(TextConditionBuilder.class);

    @Override
    public void use(StringBuilder sb, String formPrefix, ModelingField field, List<SimpleDept> dptTree, List<String> selfDptIds, List<Object> args, BlockExpressionModel blockItem) {
        TextFieldConditionModel textFieldConditionModel = (TextFieldConditionModel) blockItem.getValue();
        String value = textFieldConditionModel.getText();

        String fieldId = field.getId();
        if (blockItem.getOperator() == ConditionOperator.LIKE) {
            sb.append(fieldId).append(" LIKE '%").append(escapeSql(value)).append("%'");
        } else if (blockItem.getOperator() == ConditionOperator.NOT_LIKE) {
            sb.append(fieldId).append(" NOT LIKE '%").append(escapeSql(value)).append("%'");
        } else if (blockItem.getOperator() == ConditionOperator.EQ) {
            int startIdx = args.size();
            args.add(value);
            sb.append(fieldId).append(" = #{").append(PARAM_NAME).append("[").append(startIdx).append("]}");
        } else {
            log.warn("operator is wrong: {}", blockItem);
        }

    }

    private String escapeSql(String raw){
        StringBuilder sb = null;
        int[] codePoints = raw.codePoints().toArray();
        for (int i = 0; i < codePoints.length; i++) {
            int codePoint = codePoints[i];
            if (codePoint == '%' || codePoint == '_' || codePoint == '\\' || codePoint == '\''){
                if (sb == null){
                    sb = new StringBuilder(codePoints.length * 2);
                    boolean start = true;
                    for (int j = 0; j < i; j++) {
                        if (Character.isWhitespace(codePoints[j]) && start){
                            continue;
                        }else {
                            sb.appendCodePoint(codePoints[j]);
                            start = false;
                        }
                    }
                }
                sb.appendCodePoint('\\');
                sb.appendCodePoint(codePoint);
                if (codePoint == '\\'){
                    sb.appendCodePoint('\\');
                }
            }else {
                if (sb != null){
                    sb.appendCodePoint(codePoint);
                }
            }
        }

        if (sb != null){
            int length = sb.length();
            for (int i = codePoints.length - 1; i >= 0; i--) {
                if (Character.isWhitespace(codePoints[i])){
                    length--;
                }else {
                    break;
                }
            }
            sb.setLength(length);
        }
        return sb == null ? raw.trim() : sb.toString();
    }

}
