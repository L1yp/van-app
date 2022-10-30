package com.l1yp.model.db.modeling.field;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "type", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = NumberInputFieldScheme.class, name = "number"),
        @JsonSubTypes.Type(value = TextInputFieldScheme.class, name = "text"),
        @JsonSubTypes.Type(value = OptionFieldScheme.class, name = "option"),
        @JsonSubTypes.Type(value = UserFieldScheme.class, name = "user"),
        @JsonSubTypes.Type(value = DeptFieldScheme.class, name = "dept"),
        @JsonSubTypes.Type(value = DateFieldScheme.class, name = "date"),
})
@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
public class FieldScheme {

    private FieldType type;

    public FieldType getType() {
        return type;
    }

    public void setType(FieldType type) {
        this.type = type;
    }
}
