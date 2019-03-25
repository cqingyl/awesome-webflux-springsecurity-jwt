package com.dawn.awesomewebfluxspringsecurityjwt.service;

import org.springframework.security.core.userdetails.UserDetails;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
public interface ISysUserPermissionService {
    Mono<UserDetails> getByUserName(String username);
}
