package com.l1yp.model.db.modeling.page;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.l1yp.model.common.Tree;

import javax.validation.constraints.Pattern;
import java.util.Map;

@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
public class PageWidget extends Tree<PageWidget> {
    private String id;

    @Pattern(regexp = "text-input|number-input|user-select|dept-select|single-select|multi-select|date-picker|date-range-picker")
    private String component;

    private String category;

    private FormItemAttr formItemAttrs;

    private Map<String, Object> attrs;

    @JsonNaming(LowerCamelCaseStrategy.class)
    @JsonInclude(Include.NON_NULL)
    public static class FormItemAttr {
        private String label;
        private String labelWidth;
        private String prop;
        private Boolean required;
        private String size;

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public String getLabelWidth() {
            return labelWidth;
        }

        public void setLabelWidth(String labelWidth) {
            this.labelWidth = labelWidth;
        }

        public String getProp() {
            return prop;
        }

        public void setProp(String prop) {
            this.prop = prop;
        }

        public Boolean getRequired() {
            return required;
        }

        public void setRequired(Boolean required) {
            this.required = required;
        }

        public String getSize() {
            return size;
        }

        public void setSize(String size) {
            this.size = size;
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public FormItemAttr getFormItemAttrs() {
        return formItemAttrs;
    }

    public void setFormItemAttrs(FormItemAttr formItemAttrs) {
        this.formItemAttrs = formItemAttrs;
    }

    public Map<String, Object> getAttrs() {
        return attrs;
    }

    public void setAttrs(Map<String, Object> attrs) {
        this.attrs = attrs;
    }
}
/*
{
            "id": "field_la8w8cyv",
            "component": "text-input",
            "category": "form-item",
            "formItemAttrs": {
                "label": "文本框"
            },
            "attrs": {
                "placeholder": "输入字符串",
                "textarea": false,
                "clearable": false,
                "showWordLimit": false,
                "autofocus": false,
                "validateEvent": false,
                "style": "width: 100%"
            },
            "children": [],
            "key": 1
        },
 */