package com.l1yp.model.common;

/**
 * 2021/9/7 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class ResultData<T> {

    private int code;

    private String message;

    private T data;

    private ErrorInfo errorInfo;

    public ResultData(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResultData(int code, String message, T data) {
        this(code, message);
        this.data = data;
    }

    public ResultData(int code, String message, T data, ErrorInfo errorInfo) {
        this(code, message, data);
        this.errorInfo = errorInfo;
    }

    public static final ResultData<Void> OK = new ResultData<>(200, "ok", null, null);

    public static <S> ResultData<S> ok(S data) {
        return new ResultData<>(200, "ok", data, null);
    }

    public static <S> ResultData<S> err(int statusCode, String message) {
        return new ResultData<>(statusCode, message, null, null);
    }

    public static <S> ResultData<S> err(int statusCode, String message, ErrorInfo errorInfo) {
        return new ResultData<>(statusCode, message, null, errorInfo);
    }

    public static <S> ResultData<S> err(int statusCode, String message, int errCode, String errMessage) {
        return new ResultData<>(statusCode, message, null, new ErrorInfo(errCode, errMessage));
    }

    public static <S> ResultData<S> err(int statusCode, String message, int errCode, String errMessage, Object errData) {
        return new ResultData<>(statusCode, message, null, new ErrorInfo(errCode, errMessage));
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

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public ErrorInfo getErrorInfo() {
        return errorInfo;
    }

    public void setErrorInfo(ErrorInfo errorInfo) {
        this.errorInfo = errorInfo;
    }
}
