package com.l1yp.util;

import org.springframework.cglib.beans.BeanCopier;

import java.util.concurrent.ConcurrentHashMap;

public class BeanCopierUtil {

    private static final ConcurrentHashMap<BeanCopierKey, BeanCopier> CACHE = new ConcurrentHashMap<>(128);

    public static void copy(Object source, Object target) {
        Class<?> sourceClazz = source.getClass();
        Class<?> targetClazz = target.getClass();
        BeanCopierKey beanCopierKey = BeanCopierKey.buildKey(sourceClazz, targetClazz);
        BeanCopier beanCopier = CACHE.computeIfAbsent(beanCopierKey, k -> BeanCopier.create(sourceClazz, targetClazz, false));
        beanCopier.copy(source, target, null);
    }


    private static class BeanCopierKey {
        public Class<?> sourceClazz;
        public Class<?> targetClazz;

        private BeanCopierKey() {}

        public static BeanCopierKey buildKey(Class<?> sourceClazz, Class<?> targetClazz) {
            BeanCopierKey bean = new BeanCopierKey();
            bean.sourceClazz = sourceClazz;
            bean.targetClazz = targetClazz;
            return bean;
        }

        @Override
        public boolean equals(Object obj) {
            return obj instanceof BeanCopierKey && ((BeanCopierKey) obj).sourceClazz.equals(sourceClazz) && ((BeanCopierKey) obj).targetClazz.equals(targetClazz);
        }
    }

}
