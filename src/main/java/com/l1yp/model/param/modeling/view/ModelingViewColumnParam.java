package com.l1yp.model.param.modeling.view;

import com.l1yp.model.db.modeling.ModelingViewColumn.TableAlign;

public class ModelingViewColumnParam {

    private String fieldId;

    private Integer width;

    private TableAlign align;

    private Boolean filterable;

    private Boolean sortable;

    private Boolean resizable;

    private String condition;

    public String getFieldId() {
        return fieldId;
    }

    public void setFieldId(String fieldId) {
        this.fieldId = fieldId;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public TableAlign getAlign() {
        return align;
    }

    public void setAlign(TableAlign align) {
        this.align = align;
    }

    public Boolean getFilterable() {
        return filterable;
    }

    public void setFilterable(Boolean filterable) {
        this.filterable = filterable;
    }

    public Boolean getSortable() {
        return sortable;
    }

    public void setSortable(Boolean sortable) {
        this.sortable = sortable;
    }

    public Boolean getResizable() {
        return resizable;
    }

    public void setResizable(Boolean resizable) {
        this.resizable = resizable;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
}
