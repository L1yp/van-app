package com.l1yp.model.db.modeling.permission;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.l1yp.model.db.modeling.field.FieldType;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class BlockExpressionModel {

    private String field;

    private ConditionOperator operator;

    private FieldConditionModel value;

    @JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "type", visible = true)
    @JsonSubTypes({
            @JsonSubTypes.Type(value = UserFieldConditionModel.class, name = "user"),
            @JsonSubTypes.Type(value = DeptFieldConditionModel.class, name = "dept"),
            @JsonSubTypes.Type(value = OptionFieldConditionModel.class, name = "option"),
            @JsonSubTypes.Type(value = DateFieldConditionModel.class, name = "date"),
            @JsonSubTypes.Type(value = TextFieldConditionModel.class, name = "text"),
            @JsonSubTypes.Type(value = NumberFieldConditionModel.class, name = "number"),
    })
    public static class FieldConditionModel {
        private FieldType type;

        public FieldType getType() {
            return type;
        }

        public void setType(FieldType type) {
            this.type = type;
        }
    }

    public static class UserFieldConditionModel extends FieldConditionModel {

        /**
         * 本人
         */
        public static final String SELF = "SELF";
        /**
         * 本人部门
         */
        public static final String SELF_DPT = "SELF_DPT";
        /**
         * 下级部门
         */
        public static final String CHILD_DPT = "CHILD_DPT";

        /**
         * 本人部门及下级部门
         */
        public static final String SELF_CHILD_DPT = "SELF_CHILD_DPT";

        public static final Set<String> VAR_USER_OPTIONS = new HashSet<>(Arrays.asList(SELF, SELF_DPT, CHILD_DPT));

        /**
         * user id list
         */
        private List<String> userIdList;
        private String deptId;
        private boolean cascader;

        public List<String> getUserIdList() {
            return userIdList;
        }

        public void setUserIdList(List<String> userIdList) {
            this.userIdList = userIdList;
        }

        public String getDeptId() {
            return deptId;
        }

        public void setDeptId(String deptId) {
            this.deptId = deptId;
        }

        public boolean isCascader() {
            return cascader;
        }

        public void setCascader(boolean cascader) {
            this.cascader = cascader;
        }
    }

    public static class DeptFieldConditionModel extends FieldConditionModel {

        /**
         * 本人部门
         */
        public static final String SELF_DPT = "SELF_DPT";
        /**
         * 下级部门
         */
        public static final String CHILD_DPT = "CHILD_DPT";

        /**
         * 本人部门及下级部门
         */
        public static final String SELF_CHILD_DPT = "SELF_CHILD_DPT";


        private String deptId;
        private boolean cascader;

        public String getDeptId() {
            return deptId;
        }

        public void setDeptId(String deptId) {
            this.deptId = deptId;
        }

        public boolean isCascader() {
            return cascader;
        }

        public void setCascader(boolean cascader) {
            this.cascader = cascader;
        }
    }

    public static class OptionFieldConditionModel extends FieldConditionModel {
        private List<String> optionValueIdList;

        public List<String> getOptionValueIdList() {
            return optionValueIdList;
        }

        public void setOptionValueIdList(List<String> optionValueIdList) {
            this.optionValueIdList = optionValueIdList;
        }
    }

    public enum DataConditionType {
        DAY,
        WEEK,
        MONTH,
        QUARTER,
        YEAR,
        FIXED,
    }

    public static class DateFieldConditionModel extends FieldConditionModel {
        private DataConditionType dataType;
        /**
         * yyyy-MM-dd
         */
        private String range;

        public DataConditionType getDataType() {
            return dataType;
        }

        public void setDataType(DataConditionType dataType) {
            this.dataType = dataType;
        }

        public String getRange() {
            return range;
        }

        public void setRange(String range) {
            this.range = range;
        }
    }

    public static class TextFieldConditionModel extends FieldConditionModel {
        private String text;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }
    }

    public static class NumberFieldConditionModel extends FieldConditionModel {
        private BigDecimal number;

        public BigDecimal getNumber() {
            return number;
        }

        public void setNumber(BigDecimal number) {
            this.number = number;
        }
    }


    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }



    public ConditionOperator getOperator() {
        return operator;
    }

    public void setOperator(ConditionOperator operator) {
        this.operator = operator;
    }

    public FieldConditionModel getValue() {
        return value;
    }

    public void setValue(FieldConditionModel value) {
        this.value = value;
    }

    public enum ConditionOperator {
        EQ,
        LIKE,
        NOT_LIKE,

        GT, GTE, LT, LTE,

        ;

        public String getSQLOperator() {
            return switch (this) {
                case EQ -> "=";
                case GT -> ">";
                case GTE -> ">=";
                case LT -> "<";
                case LTE -> "<=";
                case LIKE -> "LIKE";
                case NOT_LIKE -> "NOT LIKE";
                default -> "";
            };
        }

    }

}


