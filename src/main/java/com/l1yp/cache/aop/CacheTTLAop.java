package com.l1yp.cache.aop;

import com.l1yp.cache.CacheExpireAt;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Component
@Aspect
@Order(-1) // 需要比redis serializer 提前执行
public class CacheTTLAop {

    @Around(value = "@annotation(com.l1yp.cache.CacheExpireAt)")
    public Object run(JoinPoint joinPoint) throws Throwable {
        try {
            Signature signature = joinPoint.getSignature();
            if (signature instanceof MethodSignature methodSignature) {
                Method method = methodSignature.getMethod();
                CacheExpireAt expireAt = method.getAnnotation(CacheExpireAt.class);
                long ttl = expireAt.value();
                CacheTTLContext.setTTL(ttl);
            }
            return ((MethodInvocationProceedingJoinPoint) joinPoint).proceed(joinPoint.getArgs());
        } finally {
            CacheTTLContext.remove();
        }
    }





}
