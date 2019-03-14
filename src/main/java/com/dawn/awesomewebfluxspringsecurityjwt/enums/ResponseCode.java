package com.dawn.awesomewebfluxspringsecurityjwt.enums;

/**
 * 错误码
 */
public enum ResponseCode {
    // todo 完善错误码
    SUCCESS(1, "SUCCESS"),
    ERROR(0, "ERROR"),
    NEED_LOGIN(10, "NEED_LOGIN"),
    ILLEGAL_ARGUMENT(3, "ILLEGAL_ARGUMENT"),
    // head
    INVALID_BODY(4, "invalid post body!"),
    // 认证相关
    INVALID_USER(401, "username or password error!"),
    // 表操作
    FIELD_ERROR(1001, "表字段错误"),
    INSERT_ERROR(1002, "插入错误"),
    UPDATE_ERROR(1003, "更新错误"),
    DELETED_ERROR(1004, "删除错误"),
    GET_ERROR(1005, "查找错误"),
    // 用户
    INVALID_USER_LOGIN_NAME(4001, "用户名不能为空！"),
    INVALID_USER_PASSWORD(4002, "密码不能为空！"),
    USER_EXISTS(4003, "用户已存在！"),
    USER_NOT_EXISTS(4004, "用户不存在！"),
    // 角色
    ROLE_EXISTS(5001, "角色已存在！"),
    ;
    private int code;
    private String desc;

    ResponseCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
