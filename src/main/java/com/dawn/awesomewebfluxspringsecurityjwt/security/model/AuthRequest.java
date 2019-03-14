package com.dawn.awesomewebfluxspringsecurityjwt.security.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AuthRequest {

    private String username;

    private String password;

}
