package com.dawn.awesomewebfluxspringsecurityjwt.service.impl;

import com.dawn.awesomewebfluxspringsecurityjwt.config.exception.CommonException;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysPermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRolePermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRoleRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import reactor.core.publisher.Flux;

import java.security.Permission;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
public class SysUserPermissionImpl implements ISysUserPermissionService {
    @Autowired
    SysRolePermissionRepository sysRolePermissionRepository;
    @Autowired
    SysUserRoleRepository sysUserRoleRepository;
    @Autowired
    SysPermissionRepository sysPermissionRepository;

    @Override
    public Flux<Permission> getByUserName(String userId) {
        // fixme
        throw new CommonException(1000, "i`m not good yet");
    }
//    @Override
//    public Mono<List<Permission>> getByUserName(String userId) {
//        return sysUserRoleRepository
//                .findAllByUserId(userId)
//                .flatMap(sur -> sysRolePermissionRepository
//                        .findAllByRoleId(sur.getRoleId())
//                        .collectList()
//                        .flatMap(srpList -> {
//                            List<SysPermission> list = new ArrayList<>();
//                            srpList.forEach(srp ->
//                                    sysPermissionRepository
//                                            .findById(srp.getPermissionId()).doOnNext(sp -> {
//                                        list.add(sp);
//
//                                    }));
//                            return Mono.just(list);
//                        });
//                );
//        return null;
//    }
}
