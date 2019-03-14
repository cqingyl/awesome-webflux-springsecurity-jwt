package com.dawn.awesomewebfluxspringsecurityjwt.config.exception;

import com.dawn.awesomewebfluxspringsecurityjwt.enums.ResponseCode;
import org.springframework.core.NestedRuntimeException;

/**
 * 业务异常
 */
public class CommonException extends NestedRuntimeException {
    private int code;
    private String msg;

    public CommonException(int code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public CommonException(ResponseCode responseCode) {
        super(responseCode.getDesc());
        this.code = responseCode.getCode();
        this.msg = responseCode.getDesc();
    }


    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}