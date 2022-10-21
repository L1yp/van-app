package com.l1yp.model.db.workflow.field;

import java.math.BigDecimal;

public class NumberInputFieldScheme extends FieldScheme {

    /**
     * 显示格式
     */
    private String formatter;

    private BigDecimal min;
    private BigDecimal max;
    private BigDecimal defaultValue;

    /**
     * 数值精度/小数位数
     */
    private Integer precision;

    public String getFormatter() {
        return formatter;
    }

    public void setFormatter(String formatter) {
        this.formatter = formatter;
    }

    public BigDecimal getMin() {
        return min;
    }

    public void setMin(BigDecimal min) {
        this.min = min;
    }

    public BigDecimal getMax() {
        return max;
    }

    public void setMax(BigDecimal max) {
        this.max = max;
    }

    public BigDecimal getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(BigDecimal defaultValue) {
        this.defaultValue = defaultValue;
    }

    public Integer getPrecision() {
        return precision;
    }

    public void setPrecision(Integer precision) {
        this.precision = precision;
    }
}
