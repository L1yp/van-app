package com.l1yp.workflow.base;

import java.util.List;

public class OptionValueModel<T> {

    private String labelField;

    private String valueField;

    private String disabledField;

    private Object disabledValue;

    private List<T> data;

    public String getLabelField() {
        return labelField;
    }

    public void setLabelField(String labelField) {
        this.labelField = labelField;
    }

    public String getValueField() {
        return valueField;
    }

    public void setValueField(String valueField) {
        this.valueField = valueField;
    }

    public String getDisabledField() {
        return disabledField;
    }

    public void setDisabledField(String disabledField) {
        this.disabledField = disabledField;
    }

    public Object getDisabledValue() {
        return disabledValue;
    }

    public void setDisabledValue(Object disabledValue) {
        this.disabledValue = disabledValue;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
