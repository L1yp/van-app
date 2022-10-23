package com.l1yp.conf;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.l1yp.model.db.system.User;
import com.l1yp.util.RequestUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Date;

@Configuration
public class MybatisPlusConfig implements MetaObjectHandler, InitializingBean {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // 设置jackson type handler 的 property 策略为 下划线
        ObjectMapper objectMapper = JacksonTypeHandler.getObjectMapper();
        objectMapper.setPropertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE);
    }

    @Override
    public void insertFill(MetaObject metaObject) {
        User loginUser = RequestUtils.getLoginUser();
        setFieldValByName("updateBy", loginUser.getId(), metaObject);
        setFieldValByName("createBy", loginUser.getId(), metaObject);
        setFieldValByName("updateTime", new Date(), metaObject);
        setFieldValByName("createTime", new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        User loginUser = RequestUtils.getLoginUser();
        setFieldValByName("updateBy", loginUser.getId(), metaObject);
        setFieldValByName("updateTime", new Date(), metaObject);
    }
}
