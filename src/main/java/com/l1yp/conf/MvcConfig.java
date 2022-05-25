package com.l1yp.conf;

import cn.dev33.satoken.interceptor.SaAnnotationInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * @Author Lyp
 * @Date   2020/7/11
 * @Email  l1yp@qq.com
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SaAnnotationInterceptor()).addPathPatterns("/**");
    }

    static String HEADERS = "Origin,Access-Control-Request-Headers,Access-Control-Allow-Headers,DNT,X-Requested-With,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Accept,Connection,Cookie,X-XSRF-TOKEN,X-CSRF-TOKEN,Authorization";
    @Override
    public void addCorsMappings(CorsRegistry registry) {

        registry.addMapping("/**")
                .allowedOriginPatterns(
                        "http*://*.liangyongpeng.com:[*]",
                        "http*://liangyongpeng.com:[*]",
                        "http*://*.l1yp.com:[*]",
                        "http*://l1yp.com:[*]",
                        "http*://*.qq.com:[*]",
                        "http*://qq.com:[*]",
                        "http*://*.tpddns.cn:[*]",
                        "http*://localhost:[*]",
                        "http*://127.0.0.1:[*]"
                )
                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS")
                .allowCredentials(true)
                .maxAge(3600)
                .allowedHeaders(HEADERS.split(","));
    }


}
