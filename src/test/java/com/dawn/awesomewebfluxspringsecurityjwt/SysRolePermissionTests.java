package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysPermissionRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRolePermissionRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.WebTestClient;
import reactor.core.publisher.Flux;

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
public class SysRolePermissionTests {
    @Autowired
    private WebTestClient webTestClient;
    @Autowired
    SysPermissionRepository sysPermissionRepository;
    @Autowired
    SysRolePermissionRepository sysRolePermissionRepository;

    @Test
    public void saveTest() {
        sysPermissionRepository.findAll()
                .flatMap(per -> {

                    SysRolePermission srp = new SysRolePermission();
                    srp.setRoleId("5c876d3f28a07d1ddcec6629");
                    srp.setPermissionId(per.getId());
                    return sysRolePermissionRepository.save(srp);
                }).collectList().block();
    }

    @Test
    public void saveListTest() {
        List<SysPermission> list = new ArrayList<>();
        SysPermission sysPermission = new SysPermission();
        sysPermission.setName("grant role");
        sysPermission.setDescription("ROLE_GRANT_ROLE");
        list.add(sysPermission);

        sysPermission = new SysPermission();
        sysPermission.setName("create role");
        sysPermission.setDescription("ROLE_CREATE_ROLE");
        list.add(sysPermission);

        sysPermission = new SysPermission();
        sysPermission.setName("update role");
        sysPermission.setDescription("ROLE_UPDATE_ROLE");
        list.add(sysPermission);

        sysPermission = new SysPermission();
        sysPermission.setName("delete role");
        sysPermission.setDescription("ROLE_DELETE_ROLE");
        list.add(sysPermission);

        sysPermission = new SysPermission();
        sysPermission.setName("query role");
        sysPermission.setDescription("ROLE_QUERY_ROLE");
        list.add(sysPermission);

        sysPermissionRepository.saveAll(list).collectList().block();
    }
}