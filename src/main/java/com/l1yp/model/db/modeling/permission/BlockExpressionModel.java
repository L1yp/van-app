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
        private List<String> users;
        private String dptId;
        private boolean cascader;

        public List<String> getUsers() {
            return users;
        }

        public void setUsers(List<String> users) {
            this.users = users;
        }

        public String getDptId() {
            return dptId;
        }

        public void setDptId(String dptId) {
            this.dptId = dptId;
        }

        public boolean isCascader() {
            return cascader;
        }

        public void setCascader(boolean cascader) {
            this.cascader = cascader;
        }
    }

    public static class DeptFieldConditionModel extends FieldConditionModel {

        private String dptId;
        private boolean cascader;

        public String getDptId() {
            return dptId;
        }

        public void setDptId(String dptId) {
            this.dptId = dptId;
        }

        public boolean isCascader() {
            return cascader;
        }

        public void setCascader(boolean cascader) {
            this.cascader = cascader;
        }
    }

    public static class OptionFieldConditionModel {
        private List<String> selected;

        public List<String> getSelected() {
            return selected;
        }

        public void setSelected(List<String> selected) {
            this.selected = selected;
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
        private String value;

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
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
        EQ, LIKE, NOT_LIKE,
    }

}


