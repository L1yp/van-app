package com.l1yp.flowable.listener;

import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.common.engine.api.delegate.event.FlowableEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEventListener;
import org.flowable.common.engine.api.delegate.event.FlowableEventType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Set;

/**
 * 流程正常完成监听器
 */
@Component
public class ProcessCompletedEventListener implements FlowableEventListener {

    private static final Logger log = LoggerFactory.getLogger(ProcessCompletedEventListener.class);

    @Override
    public void onEvent(FlowableEvent event) {
        log.info("onEvent: {}", event);
    }

    @Override
    public boolean isFailOnException() {
        return false;
    }

    @Override
    public boolean isFireOnTransactionLifecycleEvent() {
        return false;
    }

    @Override
    public String getOnTransaction() {
        return null;
    }

    @Override
    public Collection<? extends FlowableEventType> getTypes() {
        return Set.of(FlowableEngineEventType.PROCESS_COMPLETED);
    }
}
