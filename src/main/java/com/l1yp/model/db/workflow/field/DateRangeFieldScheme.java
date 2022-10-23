package com.l1yp.model.db.workflow.field;

import java.util.List;

public class DateRangeFieldScheme extends FieldScheme {

    private DateRangeType dateRangeType;

    /**
     * 显示在 输入框中的格式
     */
    private String format;

    /**
     * 值格式
     */
    private String valueFormat;


    private List<String> defaultValue;

    public DateRangeType getDateRangeType() {
        return dateRangeType;
    }

    public void setDateRangeType(DateRangeType dateRangeType) {
        this.dateRangeType = dateRangeType;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getValueFormat() {
        return valueFormat;
    }

    public void setValueFormat(String valueFormat) {
        this.valueFormat = valueFormat;
    }

    public List<String> getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(List<String> defaultValue) {
        this.defaultValue = defaultValue;
    }

    public enum DateRangeType {
        daterange,
        datetimerange,
    }

}
