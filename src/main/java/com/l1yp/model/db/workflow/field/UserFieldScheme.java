package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.l1yp.model.db.workflow.field.UserFieldScheme.ClassUserFieldScheme;
import com.l1yp.model.db.workflow.field.UserFieldScheme.FixedUserFieldScheme;

import java.util.List;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "from", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = ClassUserFieldScheme.class, name = "class"),
        @JsonSubTypes.Type(value = FixedUserFieldScheme.class, name = "fixed"),
        @JsonSubTypes.Type(value = UserFieldScheme.class, name = "all"),
})
public class UserFieldScheme extends FieldScheme {

    private Boolean multiple;

    private UserOptionFrom from;

    public Boolean getMultiple() {
        return multiple;
    }

    public void setMultiple(Boolean multiple) {
        this.multiple = multiple;
    }

    public UserOptionFrom getFrom() {
        return from;
    }

    public void setFrom(UserOptionFrom from) {
        this.from = from;
    }

    public static class ClassUserFieldScheme extends UserFieldScheme {

        private String className;

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }
    }

    public static class FixedUserFieldScheme extends UserFieldScheme {
        private List<String> userIds;

        public List<String> getUserIds() {
            return userIds;
        }

        public void setUserIds(List<String> userIds) {
            this.userIds = userIds;
        }
    }

    public enum UserOptionFrom {
        ALL,
        CLASS,
        FIXED,
    }

}
