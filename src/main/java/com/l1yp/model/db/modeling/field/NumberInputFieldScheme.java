package com.l1yp.model.db.modeling.field;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.math.BigDecimal;

/**
 * <a href="https://dev.mysql.com/doc/refman/8.0/en/precision-math-decimal-characteristics.html">decimal format</a>
 */
@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
public class NumberInputFieldScheme extends FieldScheme {

    /**
     * 格式化函数
     */
    private String formatter;

    /**
     * 解析函数
     */
    private String parser;

    private BigDecimal min;
    private BigDecimal max;
    private BigDecimal defaultValue;


    /**
     * D
     * 数值精度/小数位数
     * 若为0 则为BIGINT 否则为decimal
     */
    @Min(0)
    private Integer precision;

    public String getFormatter() {
        return formatter;
    }

    public void setFormatter(String formatter) {
        this.formatter = formatter;
    }

    public String getParser() {
        return parser;
    }

    public void setParser(String parser) {
        this.parser = parser;
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
