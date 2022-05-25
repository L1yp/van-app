package com.l1yp.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 2021/11/8 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class HashTool {

    public static String md5(byte[] content) {
        MessageDigest instance = null;
        try {
            instance = MessageDigest.getInstance("MD5");
            byte[] result = instance.digest(content);
            return HexUtil.bin2hex(result);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String md5(String content) {
        MessageDigest instance = null;
        try {
            instance = MessageDigest.getInstance("MD5");
            byte[] result = instance.digest(content.getBytes(StandardCharsets.UTF_8));
            return HexUtil.bin2hex(result);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(md5("123456".getBytes(StandardCharsets.UTF_8)));
    }

}
