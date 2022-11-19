package com.l1yp.util;

import java.math.BigInteger;
import java.util.Map;
import java.util.Map.Entry;

public class NumberUtil {

    public static void transformBigIntToString(Map<String, Object> data) {
        for (Entry<String, Object> entry : data.entrySet()) {
            if (entry.getValue() instanceof BigInteger value) {
                data.put(entry.getKey(), value.toString());
            }
        }
    }

}
