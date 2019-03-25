package com.dawn.awesomewebfluxspringsecurityjwt.service.impl;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysPermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRolePermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRoleRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
@Service("iSysUserPermissionService")
@Transactional(rollbackFor = Exception.class)
public class SysUserPermissionImpl implements ISysUserPermissionService {
    @Autowired
    SysRolePermissionRepository sysRolePermissionRepository;
    @Autowired
    SysUserRoleRepository sysUserRoleRepository;
    @Autowired
    SysPermissionRepository sysPermissionRepository;

    @Override
    public Flux<SysPermission> getByUserName(String userId) {
        return sysUserRoleRepository
                .findAllByUserId(userId)
                .flatMap(sur -> sysRolePermissionRepository
                        .findAllByRoleId(sur.getRoleId())
                        .flatMap(srp -> sysPermissionRepository
                                .findById(srp.getPermissionId())
                                .flux())
                );
    }
}
