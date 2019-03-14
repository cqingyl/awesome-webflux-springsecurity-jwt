package com.dawn.awesomewebfluxspringsecurityjwt.enums;

/**
 * Author: Administrator
 * DATE: 2019/2/25
 * DESC:
 **/
public enum  Roles {
    ROLE_SYSTEM_ADMIN("ROLE_SYSTEM_ADMIN", "0");

    String str;
    String code;

    Roles(String str, String code) {
        this.str = str;
        this.code = code;
    }

    public String str() {
        return str;
    }

    public String code() {
        return code;
    }
}
