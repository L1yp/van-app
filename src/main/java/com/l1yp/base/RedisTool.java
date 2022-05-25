package com.l1yp.base;

import com.l1yp.util.JsonTool;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.Duration;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;

/**
 * @Author Lyp
 * @Date   2020-06-23
 * @Email  l1yp@qq.com
 */

@Component
public class RedisTool {

    @Resource
    private RedisTemplateEx template;

    public boolean hset(RedisKey key, String field, Object val) {
        Objects.requireNonNull(val);

        if (key.getExpireAt() == 0 && key.getExpireTime() == null) {
            template.opsForHash().put(key, field, Objects.requireNonNull(JsonTool.toJson(val)));
            return true;
        }

        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {

            @SuppressWarnings("unchecked")
            @Override
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始 redis 事务

                operations.opsForHash().put(key, field, Objects.requireNonNull(JsonTool.toJson(val)));

                Duration expireTime = key.getExpireTime();
                long expireAt = key.getExpireAt();
                if (expireTime == null) {
                    operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                } else {
                    operations.expire(key, expireTime);
                }

                return operations.exec(); // 提交redis 事务
            }
        });
        if (txResults != null && txResults.size() == 2) {
            return txResults.get(0) == Boolean.TRUE && txResults.get(1) == Boolean.TRUE;
        }
        return false;
    }

    public boolean hset(RedisKey key, String field, String val) {
        Objects.requireNonNull(val);

        if (key.getExpireAt() == 0 && key.getExpireTime() == null) {
            template.opsForHash().put(key, field, val);
            return true;
        }

        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {

            @SuppressWarnings("unchecked")
            @Override
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始 redis 事务

                operations.opsForHash().put(key, field, val);

                Duration expireTime = key.getExpireTime();
                long expireAt = key.getExpireAt();
                if (expireTime == null) {
                    operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                } else {
                    operations.expire(key, expireTime);
                }

                return operations.exec(); // 提交redis 事务
            }
        });
        if (txResults != null && txResults.size() == 2) {
            return txResults.get(0) == Boolean.TRUE && txResults.get(1) == Boolean.TRUE;
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    public <K, V> V obtain(RedisKey key, Function<K, V> function, K k){
        String val = template.opsForValue().get(key);
        if (val == null){
            V v = function.apply(k);
            set(key, v);
            return v;
        }
        return (V) JsonTool.deserialize(val, key.getValType());
    }

    public String hget(RedisKey key, String field) {
        return template.<String, String>opsForHash().get(key, field);
    }

    public Map<String, String> hgetAll(RedisKey key) {
        return template.<String, String>opsForHash().entries(key);
    }


    public boolean hdel(RedisKey key, String field) {
        Long result = template.opsForHash().delete(key, field);
        return result != 0;
    }

    public boolean hmset(RedisKey key, Map<String, String> map) {
        Objects.requireNonNull(map);

        if (key.getExpireAt() == 0 && key.getExpireTime() == null) {
            template.opsForHash().putAll(key, map);
            return true;
        }

        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {

            @SuppressWarnings("unchecked")
            @Override
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始 redis 事务

                operations.opsForHash().putAll(key, map);

                Duration expireTime = key.getExpireTime();
                long expireAt = key.getExpireAt();
                if (expireTime == null) {
                    operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                } else {
                    operations.expire(key, expireTime);
                }

                return operations.exec(); // 提交redis 事务
            }
        });
        if (txResults != null && txResults.size() == 2) {
            return txResults.get(0) == Boolean.TRUE && txResults.get(1) == Boolean.TRUE;
        }
        return false;
    }

    public Map<String, String> hmget(RedisKey key, List<String> fields) {
        Objects.requireNonNull(fields);

        List<String> values = template.<String, String>opsForHash().multiGet(key, fields);

        Map<String, String> entries = new HashMap<>();
        for (int i = 0; i < fields.size(); i++) {
            entries.put(fields.get(i), values.get(i));
        }

        return entries;
    }


    public boolean set(RedisKey key, Object val) {
        Objects.requireNonNull(val);

        if (key.getExpireAt() == 0 && key.getExpireTime() == null) {
            template.opsForValue().set(key, Objects.requireNonNull(JsonTool.toJson(val)));
            return true;
        }

        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {

            @SuppressWarnings("unchecked")
            @Override
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始 redis 事务

                operations.opsForValue().set(key, Objects.requireNonNull(JsonTool.toJson(val)));

                Duration expireTime = key.getExpireTime();
                long expireAt = key.getExpireAt();
                if (expireTime == null) {
                    operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                } else {
                    operations.expire(key, expireTime);
                }

                return operations.exec(); // 提交redis 事务
            }
        });
        if (txResults != null && txResults.size() == 2) {
            return txResults.get(0) == Boolean.TRUE && txResults.get(1) == Boolean.TRUE;
        }
        return false;
    }

    public boolean set(RedisKey key, String val) {
        Objects.requireNonNull(val);

        if (key.getExpireAt() == 0 && key.getExpireTime() == null) {
            template.opsForValue().set(key, val);
            return true;
        }

        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {

            @SuppressWarnings("unchecked")
            @Override
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始 redis 事务

                operations.opsForValue().set(key, val);

                Duration expireTime = key.getExpireTime();
                long expireAt = key.getExpireAt();
                if (expireTime == null) {
                    operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                } else {
                    operations.expire(key, expireTime);
                }

                return operations.exec(); // 提交redis 事务
            }
        });
        if (txResults != null && txResults.size() == 2) {
            return txResults.get(0) == Boolean.TRUE && txResults.get(1) == Boolean.TRUE;
        }
        return false;
    }

    public String getString(RedisKey key) {
        return template.opsForValue().get(key);
    }

    public <T> T get(RedisKey key, Class<T> clazz) {
        String val = template.opsForValue().get(key);
        if (val == null) return null;
        if (clazz == String.class){
            return (T) val;
        }
        return JsonTool.deserialize(val, clazz);
    }

    public void sadd(RedisKey key, String value){
        template.opsForSet().add(key, value);
        if (key.getExpireTime() != null){
            template.expire(key, key.getExpireTime());
        }
    }

    public boolean sdel(RedisKey key, String value){
        Long result = template.opsForSet().remove(key, value);
        return result != null && result > 0L;
    }


    public void sadd(RedisKey key, String... values){
        template.opsForSet().add(key, values);
        if (key.getExpireTime() != null){
            template.expire(key, key.getExpireTime());
        }
    }

    public String srandMember(RedisKey key){
        return template.opsForSet().randomMember(key);
    }

    public List<String> srandMembers(RedisKey key, long cnt){
        return template.opsForSet().randomMembers(key, cnt);
    }

    public Set<String> sMembers(RedisKey key){
        return template.opsForSet().members(key);
    }

    public boolean sIsMember(RedisKey key, String val) {
        return Boolean.TRUE.equals(template.opsForSet().isMember(key, val));
    }


    public void mset(Map<RedisKey, String> map) {
        List<Object> txResults = template.execute(new SessionCallback<List<Object>>() {
            @Override
            @SuppressWarnings("unchecked")
            public List<Object> execute(RedisOperations operations) throws DataAccessException {
                operations.multi(); // 开始redis 事务

                operations.opsForValue().multiSet(map);
                for (Entry<RedisKey, String> entry : map.entrySet()) {
                    RedisKey key = entry.getKey();
                    Duration expireTime = key.getExpireTime();
                    long expireAt = key.getExpireAt();
                    if (expireTime == null) {
                        operations.expireAt(key, Instant.ofEpochSecond(expireAt));
                    } else {
                        operations.expire(key, expireTime);
                    }
                }

                return operations.exec();
            }
        });
        System.out.println("txResults = " + txResults);
    }

    public List<String> mget(List<RedisKey> keys) {
        return template.opsForValue().multiGet(keys);
    }

    public boolean delete(RedisKey key) {
        Boolean result = template.delete(key);
        return result == null ? false : result;
    }

}
