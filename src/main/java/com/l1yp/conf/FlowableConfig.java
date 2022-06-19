package com.l1yp.conf;

import com.l1yp.flowable.listener.ProcessCompletedEventListener;
import com.l1yp.flowable.listener.TaskCreatedEventListener;
import org.apache.ibatis.plugin.Interceptor;
import org.flowable.common.engine.api.delegate.event.FlowableEventDispatcher;
import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Order
@Configuration
public class FlowableConfig implements EngineConfigurationConfigurer<SpringProcessEngineConfiguration> {

    @Resource
    StatementInteceptor statementInteceptor;

    @Resource
    ProcessCompletedEventListener processCompletedEventListener;

    @Resource
    TaskCreatedEventListener taskCreatedEventListener;

    @Override
    public void configure(SpringProcessEngineConfiguration engineConfiguration) {
        List<Interceptor> interceptors = new ArrayList<>();
        interceptors.add(statementInteceptor);
        engineConfiguration.setCustomMybatisInterceptors(interceptors);
        engineConfiguration.setEnableEventDispatcher(true); // default to true
        engineConfiguration.initEventDispatcher();
        FlowableEventDispatcher eventDispatcher = engineConfiguration.getEventDispatcher();
        eventDispatcher.addEventListener(processCompletedEventListener);
        eventDispatcher.addEventListener(taskCreatedEventListener);
    }


}
