package com.l1yp.workflow.base;

import java.util.List;
import java.util.Map;

public interface IOptionProvider<T> {

    List<OptionValueModel<T>> findAll();


    List<OptionValueModel<T>> generate(String workflowType, String pageType, Map<String, Object> variables);


    public enum PageType {
        ADD,
        UPDATE,
    }

}
