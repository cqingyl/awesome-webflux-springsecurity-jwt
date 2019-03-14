package com.dawn.awesomewebfluxspringsecurityjwt.repository;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Repository
public interface SysUserRepository extends ReactiveMongoRepository<SysUser, String> {
    Mono<SysUser> findByUsernameAndPassword(String username, String password);

    Mono<SysUser> findByUsername(String username);

}