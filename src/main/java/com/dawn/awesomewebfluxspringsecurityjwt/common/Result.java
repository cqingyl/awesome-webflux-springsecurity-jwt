package com.dawn.awesomewebfluxspringsecurityjwt.common;

import com.dawn.awesomewebfluxspringsecurityjwt.enums.ResponseCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * 统一返回对象
 *
 * @param <T> 具体类型
 */
@JsonInclude(JsonInclude.Include.NON_NULL)//保证序列化 json，如果是 null 的对象，key 不会传递
public class Result<T> implements Serializable {
    private int status;
    private String msg;
    private T data;

    public Result(int status) {
        this.status = status;
    }

    public Result(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public Result(int status, T data) {
        this.status = status;
        this.data = data;
    }

    public Result(int status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    @JsonIgnore
    public boolean isSucceed() {
        return status == ResponseCode.SUCCESS.getCode();
    }

    public int getStatus() {
        return status;
    }

    public String getMsg() {
        return msg;
    }

    public T getData() {
        return data;
    }

    public static <T> Result<T> createBySuccess() {
        return new Result<T>(ResponseCode.SUCCESS.getCode(), ResponseCode.SUCCESS.getDesc());
    }

    public static <T> Result<T> createBySuccessMessage(String msg) {
        return new Result<T>(ResponseCode.SUCCESS.getCode(), msg);
    }

    public static <T> Result<T> createBySuccess(T data) {
        return new Result<T>(ResponseCode.SUCCESS.getCode(), data);
    }

    public static <T> Result<T> createBySuccess(String msg, T data) {
        return new Result<T>(ResponseCode.SUCCESS.getCode(), msg, data);
    }

    public static <T> Result<T> createByError() {
        return new Result<T>(ResponseCode.ERROR.getCode(), ResponseCode.ERROR.getDesc());
    }


    public static <T> Result<T> createByErrorMessage(String errorMessage) {
        return new Result<T>(ResponseCode.ERROR.getCode(), errorMessage);
    }

    public static <T> Result<T> createByErrorCodeMessage(int errorCode, String errorMessage) {
        return new Result<T>(errorCode, errorMessage);
    }

    public static <T> Result<T> createByError(ResponseCode responseCode) {
        return new Result<T>(responseCode.getCode(), responseCode.getDesc());
    }
}
