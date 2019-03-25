package com.dawn.awesomewebfluxspringsecurityjwt;

import com.dawn.awesomewebfluxspringsecurityjwt.service.IProductService;
import lombok.extern.log4j.Log4j2;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.WebTestClient;

/**
 * Author: Administrator
 * DATE: 2019/3/26
 * DESC:
 **/
@Log4j2
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ProductTests {
    @Autowired
    IProductService iProductService;
    @Autowired
    private WebTestClient webTestClient;
}