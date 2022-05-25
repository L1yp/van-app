package com.l1yp.util;

public class ProcessModelUtil {

    public static String getProcessModelTableName(String processKey) {
        return "wf_" + processKey;
    }

}
