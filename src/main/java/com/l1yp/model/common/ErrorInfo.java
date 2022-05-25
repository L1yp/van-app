package com.l1yp.model.common;

/**
 * 2021/9/7 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class ErrorInfo {

    private int code;

    private String message;

    private Object data;

    public ErrorInfo() {
    }

    public ErrorInfo(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ErrorInfo(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
