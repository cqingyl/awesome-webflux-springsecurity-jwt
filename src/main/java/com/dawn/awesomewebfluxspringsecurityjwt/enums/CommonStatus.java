package com.dawn.awesomewebfluxspringsecurityjwt.enums;

/**
 * Author: Administrator
 * DATE: 2019/1/30
 * DESC:
 **/
public enum CommonStatus {
    A("A"), P("P");

    private String str;

    CommonStatus(String str) {
        this.str = str;
    }

    public String str() {
        return str;
    }
}