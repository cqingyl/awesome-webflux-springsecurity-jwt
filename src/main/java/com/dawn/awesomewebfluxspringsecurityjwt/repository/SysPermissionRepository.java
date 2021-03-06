package com.dawn.awesomewebfluxspringsecurityjwt.repository;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Repository
public interface SysPermissionRepository extends ReactiveMongoRepository<SysPermission, String> {
}
