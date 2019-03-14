package com.dawn.awesomewebfluxspringsecurityjwt.security;

import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;


/**
 * Author: Administrator
 * DATE: 2019/2/18
 * DESC:
 **/
@Log4j2
@Service
public class MyReactiveUserDetailsService implements ReactiveUserDetailsService {

    @Autowired
    PBKDF2Encoder encoder;

//    @Autowired
//    SysUserMapper sysUserMapper;
//
//    @Autowired
//    SysPermissionMapper sysPermissionMapper;
//
//    @Autowired
//    SysRolePermissionMapper sysRolePermissionMapper;

    @Autowired
    SysUserRepository sysUserRepository;

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        return sysUserRepository
                .findByUsername(username)
                .flatMap(sysUser -> {
                    MyUserDetails userDetails = new MyUserDetails();
                    userDetails.setSysUser(sysUser);
                    userDetails.setSysPermissions();
                    return Mono.justOrEmpty(userDetails);
                });

//        MyUserDetails userDetails = new MyUserDetails();
//        userDetails.setSysUser(sysUser);
//        userDetails.setLoginName(loginName);
//        userDetails.setPassword(encoder.encode(sysUser.getPassword()));
//
//        return Mono.just(userDetails);
    }
}
