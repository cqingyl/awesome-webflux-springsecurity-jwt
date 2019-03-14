package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUserRole;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRoleRepository;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.WebTestClient;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/

@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SysUserRoleTests {
    @Autowired
    private WebTestClient webTestClient;
    @Autowired
    SysUserRoleRepository sysUserRoleRepository;

    @Test
    public void saveTest() {
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setRoleId("5c876dec28a07d147092ab89");
        sysUserRole.setUserId("5c874fe228a07d0838970119");
        sysUserRoleRepository.save(sysUserRole).block();
    }
}