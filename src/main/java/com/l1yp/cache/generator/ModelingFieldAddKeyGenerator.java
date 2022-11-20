package com.l1yp.cache.generator;

import com.l1yp.model.db.modeling.ModelingField.FieldScope;
import com.l1yp.model.db.modeling.ModelingModule;
import com.l1yp.model.param.modeling.field.ModelingFieldAddParam;
import org.jetbrains.annotations.NotNull;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Component("ModelingFieldAddKeyGenerator")
public class ModelingFieldAddKeyGenerator implements KeyGenerator {

    @NotNull
    @Override
    public Object generate(Object target, Method method, Object... params) {
        ModelingFieldAddParam param = (ModelingFieldAddParam) params[0];
        ModelingModule module = null;
        if (param.getScope() == FieldScope.ENTITY_PRIVATE) {

        }
        return "modeling-field:";
    }
}
