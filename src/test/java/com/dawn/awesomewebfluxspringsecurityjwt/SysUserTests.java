package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.security.model.AuthRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserService;
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

@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SysUserTests {
    @Autowired
    private WebTestClient webTestClient;
    @Autowired
    SysUserRepository sysUserRepository;
    @Autowired
    ISysUserService iSysUserService;

    public static final String TOKEN = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU1MjQwNzYyNiwiaWF0IjoxNTUyMzc4ODI2fQ.WhHcmIFO9oQdBOU9z9xvIu1aGJQLNrtuD9Mj4UVrW05cpAzWjl-rHCwGoJqN5jSxo6SZODnhc9Vi-DCCiecoIA";

    @Test
    public void contextLoads() {
    }

    @Test
    public void signinTest() {
        AuthRequest authRequest = new AuthRequest("admin", "123456");
        webTestClient
                .post().uri("/signin")
                .accept(MediaType.APPLICATION_JSON)
                .syncBody(authRequest)
                .exchange()
                .expectStatus().isOk()
                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                .expectBody()
                .consumeWith(log::info);
    }

    @Test
    public void getErrorTest() {
        webTestClient
                .get().uri("/users/-1")
                .header("Authorization", TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isEqualTo(HttpStatus.NO_CONTENT);
    }

    @Test
    public void getTest() {
        webTestClient
                .get().uri("/users/1")
                .header("Authorization", TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                .expectBody()
                .consumeWith((log::info));
    }

    @Test
    public void pageTest() {
        webTestClient
                .get().uri("/users/page/1/2")
                .header("Authorization", TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                .expectBody()
                .consumeWith((log::info));
    }

    @Test
    public void saveTest() {
        SysUser user = new SysUser();
        user.setName("admin1");
        user.setUsername("admin10");
        user.setPassword("123456");
        user.setPhone("13300000010");
        webTestClient
                .post().uri("/users")
                .header("Authorization", TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .body(Mono.just(user), SysUser.class)
                .exchange()
                .expectStatus().isOk()
                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                .expectBody()
                .consumeWith(log::info);
    }

    @Test
    public void updateTest() {
        SysUser newS = new SysUser();
        newS.setId("5c874b7128a07d24381f8de3");
        newS.setName("admin1232112321");
        newS.setUsername("admin3");
        newS.setPassword("123456");
        newS.setPhone("13311111101");
        webTestClient
                .put().uri("/users")
                .header("Authorization", TOKEN)
                .accept(MediaType.APPLICATION_JSON)
                .body(Mono.just(newS), SysUser.class)
                .exchange()
                .expectStatus().isOk()
                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                .expectBody()
                .consumeWith(log::info);
    }

    @Test
    public void xxTest() {

    }
}
