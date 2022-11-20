package com.l1yp.cache;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.ProxyMethodInvocation;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;

@Component
@Aspect
@Order(-1) // 需要比redis serializer 提前执行
public class CacheRunningAop {

    // CacheResultType用于标识方法返回值类型信息
    @Around("@annotation(CacheResultType)")
    public Object run(JoinPoint joinPoint) {
        MethodInvocationProceedingJoinPoint arg = (MethodInvocationProceedingJoinPoint) joinPoint;
        Field field = ReflectionUtils.findField(MethodInvocationProceedingJoinPoint.class, "methodInvocation");
        field.setAccessible(true);
        ProxyMethodInvocation methodInvocation = (ProxyMethodInvocation) ReflectionUtils.getField(field, arg);

        CacheResultType resultType = methodInvocation.getMethod().getAnnotation(CacheResultType.class);
        try {
            CacheResultTypeContext.setType(resultType.value());
            return ((MethodInvocationProceedingJoinPoint) joinPoint).proceed(joinPoint.getArgs());
        } catch (Throwable e) {
            e.printStackTrace();
            return null;
        } finally {
            CacheResultTypeContext.remove();
        }
    }

}
