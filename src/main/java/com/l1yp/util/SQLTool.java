package com.l1yp.util;

/**
 * 2021/10/31 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class SQLTool {
    public static String escapeSql(String raw){
        StringBuilder sb = null;
        int[] codePoints = raw.codePoints().toArray();
        for (int i = 0; i < codePoints.length; i++) {
            int codePoint = codePoints[i];
            if (codePoint == '%' || codePoint == '_' || codePoint == '\\' || codePoint == '\''){
                if (sb == null){
                    sb = new StringBuilder(codePoints.length * 2);
                    boolean start = true;
                    for (int j = 0; j < i; j++) {
                        if (Character.isWhitespace(codePoints[j]) && start){
                            continue;
                        }else {
                            sb.appendCodePoint(codePoints[j]);
                            start = false;
                        }
                    }
                }
                sb.appendCodePoint('\\');
                sb.appendCodePoint(codePoint);
                if (codePoint == '\\'){
                    sb.appendCodePoint('\\');
                }
            }else {
                if (sb != null){
                    sb.appendCodePoint(codePoint);
                }
            }
        }

        if (sb != null){
            int length = sb.length();
            for (int i = codePoints.length - 1; i >= 0; i--) {
                if (Character.isWhitespace(codePoints[i])){
                    length--;
                }else {
                    break;
                }
            }
            sb.setLength(length);
        }
        return sb == null ? raw.trim() : sb.toString();
    }

}
