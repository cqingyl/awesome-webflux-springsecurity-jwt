package com.dawn.awesomewebfluxspringsecurityjwt.entity;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Data
public class SysUserChangePassword {
    @NotNull
    String newPassword;
    @NotNull
    String oldPassword;
    @NotNull
    String username;
}
