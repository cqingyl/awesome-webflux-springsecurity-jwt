package com.dawn.awesomewebfluxspringsecurityjwt.service;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.PageInfo;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.SysUserChangePassword;
import com.dawn.awesomewebfluxspringsecurityjwt.security.model.AuthResponse;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
public interface ISysUserService {
    Mono<SysUser> get(String id);

    Mono<PageInfo> page(CusPageRequest pageRequest);

    Mono<AuthResponse> signin(String username, String password);

    Mono<Void> remove(String id);

    Mono<SysUser> update(SysUser user);

    Mono<SysUser> signup(SysUser user);

    Mono<SysUser> changePassword(SysUserChangePassword sysUserChangePassword);

    Mono<SysUser> save(SysUser user);
}
