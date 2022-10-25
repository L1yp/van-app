package com.l1yp.model.db.workflow.field;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.l1yp.model.db.workflow.field.UserFieldScheme.ClassUserFieldScheme;
import com.l1yp.model.db.workflow.field.UserFieldScheme.FixedUserFieldScheme;

import java.util.List;


@JsonNaming(LowerCamelCaseStrategy.class)
public class UserFieldScheme extends FieldScheme {

    private Boolean multiple;

    private UserFieldSchemeContent userContent;


    public Boolean getMultiple() {
        return multiple;
    }

    public void setMultiple(Boolean multiple) {
        this.multiple = multiple;
    }

    public UserFieldSchemeContent getUserContent() {
        return userContent;
    }

    public void setUserContent(UserFieldSchemeContent userContent) {
        this.userContent = userContent;
    }

    @JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "from", visible = true)
    @JsonSubTypes({
            @JsonSubTypes.Type(value = ClassUserFieldScheme.class, name = "CLASS"),
            @JsonSubTypes.Type(value = FixedUserFieldScheme.class, name = "FIXED"),
            @JsonSubTypes.Type(value = UserFieldSchemeContent.class, name = "ALL"),
    })
    @JsonNaming(LowerCamelCaseStrategy.class)
    public static class UserFieldSchemeContent {

        private UserOptionFrom from;

        public UserOptionFrom getFrom() {
            return from;
        }

        public void setFrom(UserOptionFrom from) {
            this.from = from;
        }

    }

    public static class ClassUserFieldScheme extends UserFieldSchemeContent {

        private String className;

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }
    }

    public static class FixedUserFieldScheme extends UserFieldSchemeContent {
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
