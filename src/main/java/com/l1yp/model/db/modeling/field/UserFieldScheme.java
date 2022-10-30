package com.l1yp.model.db.modeling.field;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;


@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
public class UserFieldScheme extends FieldScheme {

    private Boolean multiple;

    public Boolean getMultiple() {
        return multiple;
    }

    public void setMultiple(Boolean multiple) {
        this.multiple = multiple;
    }


}
