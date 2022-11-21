package com.l1yp.cache;

import com.fasterxml.jackson.core.type.TypeReference;
import org.springframework.core.NamedThreadLocal;
import org.springframework.lang.Nullable;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class CacheResultTypeContext {

    private static final NamedThreadLocal<Class<?>> local = new NamedThreadLocal<>("cache-result-type");

    public static void setType(Class<?> type) {
        local.set(type);
    }

    @Nullable
    public static Class<?> getReturnType() {
        return local.get();
    }

    public static TypeReference<?> getTypeReference() {
        Class<?> clazz = local.get();
        if (clazz == null) {
            return null;
        }
        if (TypeReference.class.isAssignableFrom(clazz)) {
            Constructor<?> constructor = null;
            try {
                constructor = clazz.getConstructor();
                return (TypeReference<?>) constructor.newInstance();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else {
            return null;
        }


    }

    public static void remove() {
        local.remove();
    }


}
