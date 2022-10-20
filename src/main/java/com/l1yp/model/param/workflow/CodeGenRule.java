package com.l1yp.model.param.workflow;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.l1yp.model.param.workflow.CodeGenRule.ClassGenRule;
import com.l1yp.model.param.workflow.CodeGenRule.FixedGenRule;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.EXISTING_PROPERTY, property = "type", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = FixedGenRule.class, name = "fixed"),
        @JsonSubTypes.Type(value = ClassGenRule.class, name = "class"),
})
public class CodeGenRule {
    private String type;


    public static class FixedGenRule extends CodeGenRule {
        private String prefix;
        private String delimiter;
        private String dateFormat;
        private String joiner;
        private String numFormat;

        public String getPrefix() {
            return prefix;
        }

        public void setPrefix(String prefix) {
            this.prefix = prefix;
        }

        public String getDelimiter() {
            return delimiter;
        }

        public void setDelimiter(String delimiter) {
            this.delimiter = delimiter;
        }

        public String getDateFormat() {
            return dateFormat;
        }

        public void setDateFormat(String dateFormat) {
            this.dateFormat = dateFormat;
        }

        public String getJoiner() {
            return joiner;
        }

        public void setJoiner(String joiner) {
            this.joiner = joiner;
        }

        public String getNumFormat() {
            return numFormat;
        }

        public void setNumFormat(String numFormat) {
            this.numFormat = numFormat;
        }
    }

    public static class ClassGenRule extends CodeGenRule {
        private String className;

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
