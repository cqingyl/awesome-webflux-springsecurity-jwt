package com.dawn.awesomewebfluxspringsecurityjwt.service;

import reactor.core.publisher.Flux;

import java.security.Permission;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
public interface ISysUserPermissionService {
    Flux<Permission> getByUserName(String userId);
}
