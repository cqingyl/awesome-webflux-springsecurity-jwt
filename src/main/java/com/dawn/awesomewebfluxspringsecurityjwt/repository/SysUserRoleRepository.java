package com.dawn.awesomewebfluxspringsecurityjwt.repository;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUserRole;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Repository
public interface SysUserRoleRepository extends ReactiveMongoRepository<SysUserRole, String> {
    Flux<SysUserRole> findAllByRoleId(String roleId);

    Flux<SysUserRole> findAllByUserId(String userId);
}
