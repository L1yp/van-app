package com.l1yp.base;

import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import java.nio.charset.StandardCharsets;

/**
 * @Author Lyp
 * @Date   2020-06-23
 * @Email  l1yp@qq.com
 * RedisKey的序列化器, 仅用于key所以无需反序列化RedisKey
 */
public class RedisKeySerializer implements RedisSerializer<RedisKey> {

    @Override
    public byte[] serialize(RedisKey redisKey) throws SerializationException {
        return (redisKey == null ? null : redisKey.toString().getBytes(StandardCharsets.UTF_8));
    }

    @Override
    public RedisKey deserialize(byte[] bytes) throws SerializationException {
        // ignored
        return null;
    }


    @Override
    public Class<?> getTargetType() {
        return byte[].class;
    }
}
