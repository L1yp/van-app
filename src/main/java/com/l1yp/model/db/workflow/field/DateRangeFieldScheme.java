package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import java.util.List;

@JsonNaming(LowerCamelCaseStrategy.class)
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

    public enum DateRangeType {
        daterange,
        datetimerange,
    }

}
