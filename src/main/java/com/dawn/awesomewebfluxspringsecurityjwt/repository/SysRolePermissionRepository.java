package com.dawn.awesomewebfluxspringsecurityjwt.repository;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import reactor.core.publisher.Flux;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
public interface SysRolePermissionRepository extends ReactiveMongoRepository<SysRolePermission, String> {
    Flux<SysRolePermission> findAllByPermissionId(String permissionId);

    Flux<SysRolePermission> findAllByRoleId(String roleId);
}