package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.l1yp.model.db.workflow.field.OptionFieldScheme.ClassOptionValueFieldScheme;
import com.l1yp.model.db.workflow.field.OptionFieldScheme.DefaultOptionValueFieldScheme;
import com.l1yp.model.db.workflow.field.OptionFieldScheme.TableOptionValueFieldScheme;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "from", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = DefaultOptionValueFieldScheme.class, name = "DEFAULT"),
        @JsonSubTypes.Type(value = ClassOptionValueFieldScheme.class, name = "CLASS"),
        @JsonSubTypes.Type(value = TableOptionValueFieldScheme.class, name = "TABLE"),
})
public class OptionFieldScheme extends FieldScheme {

    /**
     * 前端组件
     */
    private String component;

    /**
     * 选项来源
     */
    private OptionValueFrom from;

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public OptionValueFrom getFrom() {
        return from;
    }

    public void setFrom(OptionValueFrom from) {
        this.from = from;
    }

    public enum OptionValueFrom {
        /**
         * 默认选项表
         */
        DEFAULT,
        /**
         * 类生成: 数据源位默认选项表
         */
        CLASS,
        /**
         * 系统内的表
         */
        TABLE,
    }

    public static class DefaultOptionValueFieldScheme extends OptionFieldScheme {
        /**
         * 数据源定义ID
         */
        private String optionTypeId;

        /**
         * 默认值ID, 多个用逗号分割
         */
        private String defaultValue;

        public String getOptionTypeId() {
            return optionTypeId;
        }

        public void setOptionTypeId(String optionTypeId) {
            this.optionTypeId = optionTypeId;
        }

        public String getDefaultValue() {
            return defaultValue;
        }

        public void setDefaultValue(String defaultValue) {
            this.defaultValue = defaultValue;
        }
    }


    public static class ClassOptionValueFieldScheme extends OptionFieldScheme {

        /**
         * 类名继承于
         * @see IOptionValueGenerator
         */
        private String className;

        /**
         * DEFAULT: 默认选项表
         * EXTERNAL: 外部数据源
         * 具体表名
         */
        private String fromTable;



        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }

        public String getFromTable() {
            return fromTable;
        }

        public void setFromTable(String fromTable) {
            this.fromTable = fromTable;
        }

    }


    public static class TableOptionValueFieldScheme extends OptionFieldScheme {

        /**
         * 表名
         */
        private String tableName;

        /**
         * 父级字段
         */
        private String parentField;
        /**
         * 名称字段
         */
        private String labelField;
        /**
         * 值字段
         */
        private String valueField;
        /**
         * 禁用标识字段
         */
        private String disabledField;
        /**
         * 禁用值
         */
        private String disabledValue;

        public String getTableName() {
            return tableName;
        }

        public void setTableName(String tableName) {
            this.tableName = tableName;
        }

        public String getParentField() {
            return parentField;
        }

        public void setParentField(String parentField) {
            this.parentField = parentField;
        }

        public String getLabelField() {
            return labelField;
        }

        public void setLabelField(String labelField) {
            this.labelField = labelField;
        }

        public String getValueField() {
            return valueField;
        }

        public void setValueField(String valueField) {
            this.valueField = valueField;
        }

        public String getDisabledField() {
            return disabledField;
        }

        public void setDisabledField(String disabledField) {
            this.disabledField = disabledField;
        }

        public String getDisabledValue() {
            return disabledValue;
        }

        public void setDisabledValue(String disabledValue) {
            this.disabledValue = disabledValue;
        }
    }

}
