package com.l1yp.base;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Lyp
 * @Date   2020-06-23
 * @Email  l1yp@qq.com
 */
public class RedisKey {
    private final String prefix;
    private List<String> args;
    private Duration expireTime;
    private long expireAt;
    private String cacheKey;
    private Class<?> valType;

    RedisKey(String prefix){
        this.prefix = prefix;
    }

    RedisKey(String prefix, Duration expireTime){
        this.prefix = prefix;
        this.expireTime = expireTime;
    }


    RedisKey(String prefix, Duration expireTime, long expireAt, Class<?> valType){
        this.prefix = prefix;
        this.expireTime = expireTime;
        this.expireAt = expireAt;
        this.valType = valType;
    }



    /**
     * 复制 前缀/过期时间
     * @return 返回新的redisKey实例
     */
    public RedisKey dup(){
        return new RedisKey(prefix, expireTime, expireAt, valType);
    }


    /**
     * 拼接一个参数
     * @param arg 要拼接的参数
     */
    public RedisKey arg(Object arg) {
        if (arg == null){
            throw new IllegalArgumentException("the arg must not be null");
        }
        if (args == null) {
            args = new ArrayList<>(4);
        }
        if (arg instanceof String) {
            args.add((String) arg);
        }else {
            args.add(String.valueOf(arg));
        }
        return this;
    }

    public Class<?> getValType() {
        return valType;
    }

    /**
     * 指定时间点过期, 需要对应服务器的时区
     */
    public long getExpireAt() {
        return expireAt;
    }

    /**
     * 多少时间之后过期
     * @return
     */
    public Duration getExpireTime() {
        return expireTime;
    }

    /**
     * 分隔符
     */
    private static final char COLON = ':';

    @Override
    public String toString() {
        if (cacheKey != null){
            return cacheKey;
        }
        if (args == null || args.isEmpty()){
            return cacheKey = prefix;
        }

        StringBuilder sb = new StringBuilder(64);
        sb.append(prefix);
        if (args == null){
            return cacheKey = sb.toString();
        }
        for (int i = 0; i < args.size(); i++) {
            sb.append(COLON);
            Object arg = args.get(i);
            sb.append(arg);
        }
        return cacheKey = sb.toString();
    }

    @Override
    public int hashCode(){
        return toString().hashCode();
    }

    @Override
    public boolean equals(Object original){
        if (original instanceof RedisKey){
            return original.toString().equals(toString());
        }
        return false;
    }

    public static class Builder {
        private final String prefix;
        private Duration expireTime;
        private long expireAt;
        private Class<?> clazz;

        public Builder(String prefix, Duration expireTime, Class<?> clazz){
            this(prefix, expireTime, 0, clazz);
        }

        public Builder(String prefix, Duration expireTime, long expireAt, Class<?> clazz){
            this.prefix = prefix;
            this.expireTime = expireTime;
            this.expireAt = expireAt;
        }

        public RedisKey build() {
            return new RedisKey(prefix, expireTime, expireAt, clazz);
        }

    }

}
