package com.l1yp.model.db.modeling.permission;

import java.util.HashMap;
import java.util.Map;

public class ConditionSQLBuilderRegistry {

    public static final Map<String, IFieldCondition> registry = new HashMap<>();

    static {
        registry.put("text", new StrConditionBuilder());
        registry.put("number", new NumberConditionBuilder());
        registry.put("option", new OptionConditionBuilder());
        registry.put("user", new UserConditionBuilder());
        registry.put("dept", new DeptConditionBuilder());
        registry.put("date", new DateConditionBuilder());
    }


    public static IFieldCondition getBuilder(String type) {
        return registry.get(type);
    }

}
