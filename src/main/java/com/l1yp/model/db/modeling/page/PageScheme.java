package com.l1yp.model.db.modeling.page;


import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.PropertyNamingStrategies.LowerCamelCaseStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import javax.validation.constraints.Pattern;
import java.util.List;

@JsonNaming(LowerCamelCaseStrategy.class)
@JsonInclude(Include.NON_NULL)
public class PageScheme {

    private LabelPosition labelPosition;

    private String labelWidth;

    @Pattern(regexp = "small|default|large")
    private String size;

    private FormMode mode;

    private String style;

    private List<PageWidget> children;

    public LabelPosition getLabelPosition() {
        return labelPosition;
    }

    public void setLabelPosition(LabelPosition labelPosition) {
        this.labelPosition = labelPosition;
    }

    public String getLabelWidth() {
        return labelWidth;
    }

    public void setLabelWidth(String labelWidth) {
        this.labelWidth = labelWidth;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public FormMode getMode() {
        return mode;
    }

    public void setMode(FormMode mode) {
        this.mode = mode;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public List<PageWidget> getChildren() {
        return children;
    }

    public void setChildren(List<PageWidget> children) {
        this.children = children;
    }
}