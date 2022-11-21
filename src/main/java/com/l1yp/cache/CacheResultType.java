package com.l1yp.cache;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface CacheResultType {
    /**
     * Returns the return type.
     *
     * @return the return type
     */
    Class<?> value();

}
