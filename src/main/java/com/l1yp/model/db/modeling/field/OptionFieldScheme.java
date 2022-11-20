package com.l1yp.model.db.modeling.field;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.JsonTypeInfo.As;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import java.util.List;


@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
@JsonTypeInfo(use = Id.CLASS)
@JsonIgnoreProperties(ignoreUnknown = true)
public class OptionFieldScheme extends FieldScheme {

    private String optionComponent;

    /**
     * 前端组件
     */
    private Boolean multiple;

    /**
     * 数据源定义ID
     */
    private String optionTypeId;

    /**
     * 默认值ID列表, 统一用多选, 单选时限制多选数量为1
     */
    private List<String> optionDefaultValue;

    public String getOptionComponent() {
        return optionComponent;
    }

    public void setOptionComponent(String optionComponent) {
        this.optionComponent = optionComponent;
    }

    public Boolean getMultiple() {
        return multiple;
    }

    public void setMultiple(Boolean multiple) {
        this.multiple = multiple;
    }

    public String getOptionTypeId() {
        return optionTypeId;
    }

    public void setOptionTypeId(String optionTypeId) {
        this.optionTypeId = optionTypeId;
    }

    public List<String> getOptionDefaultValue() {
        return optionDefaultValue;
    }

    public void setOptionDefaultValue(List<String> optionDefaultValue) {
        this.optionDefaultValue = optionDefaultValue;
    }

}
