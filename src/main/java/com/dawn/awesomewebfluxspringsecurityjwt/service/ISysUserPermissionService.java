package com.dawn.awesomewebfluxspringsecurityjwt.service;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import reactor.core.publisher.Flux;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
public interface ISysUserPermissionService {
    Flux<SysPermission> getByUserName(String userId);
}
