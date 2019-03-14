package com.dawn.awesomewebfluxspringsecurityjwt.enums;

/**
 * Author: Administrator
 * DATE: 2019/2/19
 * DESC:
 **/
public enum Users {
    ADMIN("admin","0");

    private String str;
    private String code;

    Users(String str, String code) {
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
