package com.l1yp.conf;

import com.l1yp.base.RedisKey.Builder;
import java.time.Duration;

/**
 * @Author Lyp
 * @Date   2020-06-23
 * @Email  l1yp@qq.com
 */
public interface RedisKeyConst {

    String PADDING = "/";

    Builder SMS_LOGIN = new Builder("SMS_LOGIN", Duration.ofSeconds(120L), String.class);
    Builder SMS_REGISTER = new Builder("SMS_REGISTER", Duration.ofSeconds(120L), String.class);



}
