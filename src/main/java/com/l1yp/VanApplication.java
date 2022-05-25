package com.l1yp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.l1yp.mapper")
public class VanApplication {

    public static void main(String[] args) {
        SpringApplication.run(VanApplication.class, args);
    }

}
