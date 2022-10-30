package com.l1yp.model.db.modeling.permission;

import java.util.HashMap;
import java.util.Map;

public class ConditionSQLBuilderRegistry {

    public static final Map<String, IFieldCondition> registry = new HashMap<>();

    static {
        registry.put("input", new StrConditionBuilder());
        registry.put("InputNumber", new NumberConditionBuilder());
        registry.put("select", new OptionConditionBuilder());
        registry.put("cascader", new OptionConditionBuilder());
        registry.put("checkbox", new OptionConditionBuilder());
        registry.put("radio", new OptionConditionBuilder());
        registry.put("UserSelect", new UserConditionBuilder());
        registry.put("MDepartment", new DeptConditionBuilder());
        registry.put("DatePicker", new DateConditionBuilder());
    }


    public static IFieldCondition getBuilder(String type) {
        return registry.get(type);
    }

}
