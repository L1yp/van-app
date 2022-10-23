package com.l1yp.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import java.util.regex.Pattern;

public class PinyinUtil {

    private static final Pattern chinesePattern = Pattern.compile("^\\p{sc=Han}$");

    public static String getPinyin(String source) {
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        format.setVCharType(HanyuPinyinVCharType.WITH_V);

        StringBuilder sb = new StringBuilder(source.length() * 2);
        int[] codePoints = source.codePoints().toArray();
        for (int codePoint : codePoints) {

            StringBuilder local = new StringBuilder();
            local.appendCodePoint(codePoint);
            String str = local.toString();
            if (chinesePattern.matcher(str).matches()) {
                try {
                    String[] pinyinArr = PinyinHelper.toHanyuPinyinStringArray(str.charAt(0), format);
                    for (String pinyin : pinyinArr) {
                        sb.append(pinyin);
                    }
                } catch (BadHanyuPinyinOutputFormatCombination e) {
                    throw new RuntimeException(e);
                }
            } else {
                sb.appendCodePoint(codePoint);
            }
        }
        return sb.toString();

    }

    private static final Pattern letterPattern = Pattern.compile("^[a-zA-Z]*$");


    public static boolean isPureLetter(String source) {
        return letterPattern.matcher(source).matches();
    }

}
