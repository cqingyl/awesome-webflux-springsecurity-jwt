package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRole;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysPermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRoleRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.WebTestClient;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SysPermissionTests {
    @Autowired
    private WebTestClient webTestClient;
    @Autowired
    SysPermissionRepository sysPermissionRepository;

    @Test
    public void saveTest() {
        SysPermission sysPermission = new SysPermission();
        sysPermission.setName("manager role");
        sysPermission.setDescription("ROLE_MANAGER_ROLE");
        sysPermission.setParentId("5c87709228a07d207cb680dd");
        sysPermissionRepository.save(sysPermission).block();
    }

    @Test
    public void saveListTest() {
        List<SysPermission> list = new ArrayList<>();
        SysPermission sysPermission = new SysPermission();
        sysPermission = new SysPermission();
        sysPermission.setName("manager permission");
        sysPermission.setDescription("ROLE_MANAGER_PERMISSION");
        list.add(sysPermission);

        sysPermission = new SysPermission();
        sysPermission.setName("manager product");
        sysPermission.setDescription("ROLE_MANAGER_PRODUCT");
        list.add(sysPermission);
        sysPermissionRepository.saveAll(list).collectList().block();
    }
}