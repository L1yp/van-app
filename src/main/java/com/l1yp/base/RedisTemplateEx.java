package com.l1yp.base;

import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Component;

/**
 * @Author Lyp
 * @Date   2020-06-23
 * @Email  l1yp@qq.com
 * RedisKey 模板
 */
@Component
public class RedisTemplateEx extends RedisTemplate<RedisKey, String> {

    public RedisTemplateEx(RedisConnectionFactory redisConnectionFactory) {
        setKeySerializer(new RedisKeySerializer());
        setValueSerializer(RedisSerializer.string());
        setHashKeySerializer(RedisSerializer.string());
        setHashValueSerializer(RedisSerializer.string());
        setConnectionFactory(redisConnectionFactory);
    }

}
