package com.l1yp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@MapperScan("com.l1yp.mapper")
@EnableAspectJAutoProxy(exposeProxy = true)
public class VanApplication {

    public static void main(String[] args) {
        SpringApplication.run(VanApplication.class, args);
    }

}
