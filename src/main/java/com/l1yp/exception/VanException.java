package com.l1yp.exception;

public class VanException extends RuntimeException {

    private final int code;

    public VanException(int code, String message) {
        super(message);
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
