package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonNaming(LowerCamelCaseStrategy.class)
public class TextInputFieldScheme extends FieldScheme {

    private String defaultValue;


    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }
}
