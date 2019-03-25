package com.dawn.awesomewebfluxspringsecurityjwt.security;

import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserPermissionService;
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

    @Autowired
    SysUserRepository sysUserRepository;

    @Autowired
    ISysUserPermissionService iSysUserPermissionService;

    @Override
    public Mono<UserDetails> findByUsername(String username) {
        return iSysUserPermissionService.getByUserName(username);
    }
}
