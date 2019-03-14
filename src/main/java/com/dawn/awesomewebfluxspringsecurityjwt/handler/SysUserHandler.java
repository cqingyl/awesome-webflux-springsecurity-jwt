package com.dawn.awesomewebfluxspringsecurityjwt.handler;

import com.dawn.awesomewebfluxspringsecurityjwt.common.Result;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.SysUserChangePassword;
import com.dawn.awesomewebfluxspringsecurityjwt.security.MyUserDetails;
import com.dawn.awesomewebfluxspringsecurityjwt.security.model.AuthRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.ReactiveSecurityContextHolder;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import static org.springframework.http.HttpStatus.NO_CONTENT;
import static org.springframework.http.MediaType.APPLICATION_JSON;


/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/
@Log4j2
@Configuration
public class SysUserHandler {
    @Autowired
    ISysUserService iSysUserService;

    // 获取用户
    @PreAuthorize("hasAnyAuthority('ROLE_QUERY_USER')")
    public Mono<ServerResponse> getUser(ServerRequest request) {
        String id = request.pathVariable("id");
        return iSysUserService.get(id)
                .flatMap(user -> ServerResponse
                        .ok()
                        .contentType(APPLICATION_JSON)
                        .syncBody(Result.createBySuccess(user)))
                .switchIfEmpty(ServerResponse
                        .status(NO_CONTENT).build());
    }

    // 获取用户分页
    @PreAuthorize("hasAnyAuthority('ROLE_QUERY_USER')")
    public Mono<ServerResponse> pageUser(ServerRequest request) {
        return request.bodyToMono(CusPageRequest.class)
                .defaultIfEmpty(new CusPageRequest())
                .flatMap(pageRequest -> iSysUserService
                        .page(pageRequest)
                        .flatMap(pageInfo -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess(pageInfo))));

    }

    // 登录
    public Mono<ServerResponse> signin(ServerRequest serverRequest) {
        return serverRequest.bodyToMono(AuthRequest.class)
                .flatMap(auth -> iSysUserService
                        .signin(auth.getUsername(), auth.getPassword())
                        .flatMap(t -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess(t))));
    }

    // 删除用户
    @PreAuthorize("hasAnyAuthority('ROLE_DELETE_USER')")
    public Mono<ServerResponse> deleteUser(ServerRequest request) {
        String id = request.pathVariable("id");
        return iSysUserService
                .remove(id)
                .flatMap(count -> ServerResponse
                        .ok()
                        .contentType(APPLICATION_JSON)
                        .syncBody(Result.createBySuccess()));
    }

    // 更新用户
    @PreAuthorize("hasAnyAuthority('ROLE_UPDATE_USER')")
    public Mono<ServerResponse> updateUser(ServerRequest request) {
        return request.bodyToMono(SysUser.class)
                .flatMap(user -> iSysUserService
                        .update(user)
                        .flatMap(i -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess())));

    }

    // 添加用户
    @PreAuthorize("hasAnyAuthority('ROLE_CREATE_USER')")
    public Mono<ServerResponse> saveUser(ServerRequest request) {
        return request
                .bodyToMono(SysUser.class)
                .flatMap(user -> iSysUserService
                        .save(user)
                        .flatMap(i -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess())));
    }

    // 获取当前用户
    public Mono<SysUser> getCurrentUser() {
        return ReactiveSecurityContextHolder.getContext()
                .map(SecurityContext::getAuthentication)
                .map(Authentication::getPrincipal)
                .map(principal -> {
                    MyUserDetails myUserDetails = (MyUserDetails) principal;
                    return myUserDetails.getSysUser();
                });
    }

    // 改变密码
    @PreAuthorize("hasAnyAuthority('ROLE_UPDATE_USER')")
    public Mono<ServerResponse> changePassword(ServerRequest request) {
        return request.bodyToMono(SysUserChangePassword.class)
                .flatMap(sysUserChangePassword -> iSysUserService
                        .changePassword(sysUserChangePassword)
                        .flatMap(count -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess())));
    }
}
