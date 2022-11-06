package com.l1yp.model.db.modeling.permission;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.l1yp.model.db.modeling.field.FieldType;
import com.l1yp.model.db.modeling.permission.FlowPermissionContent.DateType;
import java.util.List;


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
        /**
         * @see DateType
         */
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

    public static class TextFieldConditionModel {
        private String text;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
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
        ;

    }

}


