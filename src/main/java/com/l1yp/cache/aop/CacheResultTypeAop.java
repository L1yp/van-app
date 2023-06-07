package com.l1yp.cache.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Type;

@Component
@Aspect
@Order(-2) // 需要比redis serializer 提前执行
public class CacheResultTypeAop {

    // CacheResultType用于标识方法返回值类型信息
    @Around(value = "@annotation(org.springframework.cache.annotation.Cacheable)")
    public Object run(JoinPoint joinPoint) throws Throwable {
        Type returnType = null;
        if (joinPoint.getSignature() instanceof MethodSignature signature) {
            returnType = signature.getMethod().getGenericReturnType();
        }
        try {
            CacheResultTypeContext.setType(returnType);
            return ((MethodInvocationProceedingJoinPoint) joinPoint).proceed(joinPoint.getArgs());
        } finally {
            CacheResultTypeContext.remove();
        }
    }

}
