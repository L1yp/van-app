package com.l1yp.cache;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import java.io.IOException;

public class JacksonRedisSerializer<T> implements RedisSerializer<T> {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public byte[] serialize(T t) throws SerializationException {
        try {
            return objectMapper.writeValueAsBytes(t);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public T deserialize(byte[] bytes) throws SerializationException {
        Class<?> returnType = CacheResultTypeContext.getReturnType();
        if (returnType == null) {
            throw new RuntimeException("请先配置返回值类型");
        }
        TypeReference<?> typeReference = null;
        if (TypeReference.class.isAssignableFrom(returnType)) {
            typeReference = CacheResultTypeContext.getTypeReference();
        }


        JavaType javaType;
        if (typeReference != null) {
            javaType = objectMapper.constructType(typeReference);
        } else {
            javaType = objectMapper.constructType(returnType);
        }
        try {
            return objectMapper.readValue(bytes, javaType);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
