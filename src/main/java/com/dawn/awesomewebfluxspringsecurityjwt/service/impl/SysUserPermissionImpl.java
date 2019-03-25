package com.dawn.awesomewebfluxspringsecurityjwt.service.impl;

import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysPermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRolePermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRoleRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.security.MyUserDetails;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

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
    @Autowired
    SysUserRepository sysUserRepository;

    @Override
    public Mono<UserDetails> getByUserName(String username) {
        return sysUserRepository
                .findByUsername(username)
                .flatMap(user -> sysUserRoleRepository
                        .findAllByUserId(user.getId())
                        .flatMap(sur -> sysRolePermissionRepository
                                .findAllByRoleId(sur.getRoleId())
                                .flatMap(srp -> sysPermissionRepository
                                        .findById(srp.getPermissionId())))
                        .collectList()
                        .flatMap(spList -> {
                            MyUserDetails myUserDetails = new MyUserDetails();
                            myUserDetails.setUsername(user.getUsername());
                            myUserDetails.setSysPermissions(spList);
                            myUserDetails.setSysUser(user);
                            return Mono.just(myUserDetails);
                        }));
    }
}
