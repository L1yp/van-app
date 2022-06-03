package com.l1yp.flowable.multi.instance;

import org.flowable.engine.delegate.DelegateExecution;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

@Component("completionStrategy")
public class CompletionStrategy {

    static final Logger log = LoggerFactory.getLogger(CompletionStrategy.class);

    public boolean isCompletion(DelegateExecution execution) {

        int nrOfInstances = (int) execution.getVariable("nrOfInstances");
        int nrOfCompletedInstances = (int) execution.getVariable("nrOfCompletedInstances");

        if (nrOfInstances == nrOfCompletedInstances) {
            Set<String> variableNames = execution.getVariableNames();
            // 取出口流线名称
            List<String> outgoings = variableNames.stream().filter(it -> it.startsWith("$$$$")).toList();

            // 取出口流程 次数
            Map<String, Integer> map = outgoings.stream().collect(Collectors.toMap(it -> it, it -> (Integer) execution.getVariable(it)));
            log.info("statistics choose outgoings: {}", map);

            // 找到投票次数最多的出口
            int max = 0;
            Set<Entry<String, Integer>> entries = map.entrySet();
            Entry<String, Integer> maxEntry = null;
            for (Entry<String, Integer> entry : entries) {
                if (entry.getValue() > max) {
                    max = entry.getValue();
                    maxEntry = entry;
                }
            }

            outgoings.forEach(execution::removeVariable);

            // 设置出口
            execution.setTransientVariable("outcome", maxEntry.getKey().replace("$$$$", ""));

            return true;
        }

        return false;

    }


    public boolean isCompletion2(DelegateExecution execution) {

        int nrOfInstances = (int) execution.getVariable("nrOfInstances");
        int nrOfCompletedInstances = (int) execution.getVariable("nrOfCompletedInstances");

        if (nrOfInstances == nrOfCompletedInstances) {
            int c1 = (int) execution.getVariable("$$$$通过");
            int c2 = (int) execution.getVariable("$$$$不通过");
            log.info("通过：{}, 不通过: {}", c1, c2);

            execution.removeVariable("$$$$通过");
            execution.removeVariable("$$$$不通过");
            // 通过 个数大于等于 2 / 3 则 通过 否则 不通过
            if (c1 >= nrOfInstances * 2 / 3) {
                execution.setTransientVariable("outcome", "通过");
            } else {
                execution.setTransientVariable("outcome", "不通过");
            }

            return true;
        }

        return false;

    }


}
