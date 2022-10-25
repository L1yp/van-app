package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import java.util.List;


@JsonNaming(LowerCamelCaseStrategy.class)
public class OptionFieldScheme extends FieldScheme {

    /**
     * 前端组件
     */
    private String component;

    /**
     * 选项来源
     */
    private OptionFieldContentScheme optionContent;

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public OptionFieldContentScheme getOptionContent() {
        return optionContent;
    }

    public void setOptionContent(OptionFieldContentScheme optionContent) {
        this.optionContent = optionContent;
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

    @JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "from", visible = true)
    @JsonSubTypes({
            @JsonSubTypes.Type(value = DefaultOptionValueFieldScheme.class, name = "DEFAULT"),
            @JsonSubTypes.Type(value = ClassOptionValueFieldScheme.class, name = "CLASS"),
            @JsonSubTypes.Type(value = TableOptionValueFieldScheme.class, name = "TABLE"),
    })
    @JsonNaming(LowerCamelCaseStrategy.class)
    public static class OptionFieldContentScheme {

        private OptionValueFrom from;

        public OptionValueFrom getFrom() {
            return from;
        }

        public void setFrom(OptionValueFrom from) {
            this.from = from;
        }

    }

    public static class DefaultOptionValueFieldScheme extends OptionFieldContentScheme {
        /**
         * 数据源定义ID
         */
        private String optionTypeId;

        /**
         * 默认值ID列表, 统一用多选, 单选时限制多选数量为1
         */
        private List<String> defaultValue;

        public String getOptionTypeId() {
            return optionTypeId;
        }

        public void setOptionTypeId(String optionTypeId) {
            this.optionTypeId = optionTypeId;
        }

        public List<String> getDefaultValue() {
            return defaultValue;
        }

        public void setDefaultValue(List<String> defaultValue) {
            this.defaultValue = defaultValue;
        }
    }


    public static class ClassOptionValueFieldScheme extends OptionFieldContentScheme {

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


    public static class TableOptionValueFieldScheme extends OptionFieldContentScheme {

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

        private String condition;

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

        public String getCondition() {
            return condition;
        }

        public void setCondition(String condition) {
            this.condition = condition;
        }
    }

}
