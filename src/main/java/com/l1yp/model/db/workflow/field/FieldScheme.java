package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "type", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = NumberInputFieldScheme.class, name = "number"),
        @JsonSubTypes.Type(value = TextInputFieldScheme.class, name = "text"),
        @JsonSubTypes.Type(value = OptionFieldScheme.class, name = "option"),
        @JsonSubTypes.Type(value = UserFieldScheme.class, name = "user"),
        @JsonSubTypes.Type(value = DeptFieldScheme.class, name = "dept"),
        @JsonSubTypes.Type(value = DateFieldScheme.class, name = "date"),
        @JsonSubTypes.Type(value = DateRangeFieldScheme.class, name = "date-range"),
})
public class FieldScheme {

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
