package com.l1yp.model.db.modeling.permission;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class FlowPermissionContent {
    private String text;
    private BlockContent content;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public BlockContent getContent() {
        return content;
    }

    public void setContent(BlockContent content) {
        this.content = content;
    }

    public interface ElemType {
        String AND = "AND";
        String OR = "OR";
        String START = "START";
        String END = "END";
        String BLOCK = "BLOCK";
    }

    public interface DateType {
        String CUR_DAY = "今天";
        String CUR_WEEK = "本周";
        String CUR_QUARTER = "本季度";
        String CUR_YEAR = "本年";
        String FIXED = "固定";
    }

    public enum ExpressionOperator {
        EQ,
        LIKE,
        NOT_LIKE,
    }


    public static class BlockContent {
        /**
         * @see ElemType
         */
        private String type;

        private BlockItem attrs;
    }

    public static class BlockItem {

        private String fieldId;

        private String type;

        private ExpressionOperator operator;

        private String val;

        public String getFieldId() {
            return fieldId;
        }

        public void setFieldId(String fieldId) {
            this.fieldId = fieldId;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public ExpressionOperator getOperator() {
            return operator;
        }

        public void setOperator(ExpressionOperator operator) {
            this.operator = operator;
        }

        public String getVal() {
            return val;
        }

        public void setVal(String val) {
            this.val = val;
        }
    }




    public static class StrConditionModel {
        private String value;

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

    public static class NumberConditionModel {
        /**
         * NumberValue
         */
        private String value;

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }


    public static class DateConditionModel {
        /**
         * @see DateType
         */
        private String type;
        /**
         * yyyy-MM-dd
         */
        private List<String> range;

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public List<String> getRange() {
            return range;
        }

        public void setRange(List<String> range) {
            this.range = range;
        }
    }


    public static class UserConditionModel {

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

        public static final Set<String> VAR_USER_OPTIONS = new HashSet<>(Arrays.asList(SELF, SELF_DPT, CHILD_DPT));

        /**
         * user id list
         */
        private List<String> users;
        private String dptId;
        private boolean containerChildren;

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

        public boolean isContainerChildren() {
            return containerChildren;
        }

        public void setContainerChildren(boolean containerChildren) {
            this.containerChildren = containerChildren;
        }
    }

    public static class DeptConditionModel {

        /**
         * 本人部门
         */
        public static final String SELF_DPT = "SELF_DPT";


        private String dptId;
        private boolean containerChildren;

        public String getDptId() {
            return dptId;
        }

        public void setDptId(String dptId) {
            this.dptId = dptId;
        }

        public boolean isContainerChildren() {
            return containerChildren;
        }

        public void setContainerChildren(boolean containerChildren) {
            this.containerChildren = containerChildren;
        }
    }

    public static class OptionConditionModel {
        private List<String> selected;

        public List<String> getSelected() {
            return selected;
        }

        public void setSelected(List<String> selected) {
            this.selected = selected;
        }
    }
}
