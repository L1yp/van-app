package com.l1yp.util;


import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.ThreadLocalRandom;

public class HexUtil {
    private static final char[] lower_digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    private static final char[] upper_digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    public static final byte[] emptybytes = new byte[0];


    public static String bin2hex(byte[] src, boolean isUpperCase){
        if(src == null || src.length == 0) return "";
        char[] chs = new char[src.length * 2];
        int i = 0;
        char[] digits = isUpperCase ? upper_digits : lower_digits;
        for (int j = 0; j < src.length; j++){
            chs[i++] = digits[(src[j] >> 4) & 15];
            chs[i++] = digits[src[j] & 15];
        }
        return new String(chs);
    }

    public static String bin2hex(byte[] src){
        if(src == null || src.length == 0) return "";
        char[] chs = new char[src.length * 2];
        int i = 0;
        for (int j = 0; j < src.length; j++){
            chs[i++] = lower_digits[(src[j] >> 4) & 15];
            chs[i++] = lower_digits[src[j] & 15];
        }
//        for (byte b : src) {
//            chs[i++] = digits[(b>>4) & 0xF];
//            chs[i++] = digits[b & 0xF];
//        }

        return new String(chs);
    }

    public static String bin2hex(byte[] src, int pos, int len){
        if(src == null || src.length == 0) return "";
        char[] chs = new char[len * 2];
        int i = 0;
        for (int j = 0; j < len; j++){
            chs[i++] = lower_digits[(src[pos + j] >> 4) & 15];
            chs[i++] = lower_digits[src[pos + j] & 15];
        }
        return new String(chs);
    }

    public static String bin2hex(ByteBuffer buffer, int pos, int len){
        return bin2hex(buffer.array(), pos, len);
    }

    public static String bin2hex(ByteBuffer buffer){
        if(buffer == null || buffer.remaining() == 0) return "";
        int position = buffer.position();
        String result = bin2hex(buffer.array(), position, buffer.remaining());
        buffer.position(position);
        return result;
    }

    public static String bin2hex(ByteBuffer buffer, int pos){
        int len = buffer.limit() - pos;
        return bin2hex(buffer.array(), pos, len);
    }

    public static byte[] hex2bin(String src){
        if (src == null || src.length() == 0) return new byte[0];
        char[] chs = src.toCharArray();
        byte[] bys = new byte[chs.length / 2];
        int j = 0;
        for(int i = 0; i < chs.length; i += 2){
            bys[j++] = (byte) (char2Byte(chs[i]) << 4 | char2Byte(chs[i + 1]));

        }
        return bys;
    }

    public static byte char2Byte(char ch) {
        if (ch >= '0' && ch <= '9') {
            return (byte) (ch - 48);
        }
        if (ch >= 'a' && ch <= 'f') {
            return (byte) ((ch - 97) + 10);
        }
        if (ch < 'A' || ch > 'F') {
            return (byte) 0;
        }
        return (byte) ((ch - 65) + 10);
    }

    public static boolean isHexDigit(int code){
        return (code >= '0' && code <= '9') || (code >= 'a' && code <= 'f') || (code >= 'A' && code <= 'F');
    }

    public static String randomCode(int count) {
        StringBuilder sb = new StringBuilder(count);
        for (int i = 0; i < count; i++) {
            int idx = ThreadLocalRandom.current().nextInt(lower_digits.length);
            sb.append(lower_digits[idx]);
        }
        return sb.toString();
    }

    public static void main(String[] args) throws IOException {
        ByteBuffer buffer = ByteBuffer.allocate(16);
        for (int i = 0; i < 16; i++) {
            buffer.put((byte) i);
        }
        buffer.flip();

        buffer.get();
        buffer.get();
        buffer.get();
        buffer.get();

        System.out.println(bin2hex(buffer, buffer.position()));
        System.out.println(bin2hex(buffer, buffer.position()));
        System.out.println(bin2hex(buffer, buffer.position()));

        /*
        00 01 00 00 00 07 00 38 2F E9 B2 00 00
00 01 00 00 00 05 01 00 00 00 00 00 00
         */
    }
}
