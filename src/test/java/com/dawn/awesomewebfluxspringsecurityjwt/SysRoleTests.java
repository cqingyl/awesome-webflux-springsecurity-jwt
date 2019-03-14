package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRole;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysRoleRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRoleRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.security.model.AuthRequest;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.WebTestClient;
import reactor.core.publisher.Mono;

import static com.dawn.awesomewebfluxspringsecurityjwt.SysUserTests.TOKEN;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SysRoleTests {
    @Autowired
    private WebTestClient webTestClient;
    @Autowired
    SysRoleRepository sysRoleRepository;

    @Test
    public void saveTest() {
        SysRole role = new SysRole();
        role.setName("user");
        role.setDescription("ROLE_USER");
        sysRoleRepository.save(role).block();
    }
}