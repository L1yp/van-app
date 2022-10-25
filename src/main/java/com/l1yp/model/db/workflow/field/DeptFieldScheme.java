package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonNaming(LowerCamelCaseStrategy.class)
public class DeptFieldScheme extends FieldScheme {

    private Boolean multiple;

    public Boolean getMultiple() {
        return multiple;
    }

    public void setMultiple(Boolean multiple) {
        this.multiple = multiple;
    }
}
