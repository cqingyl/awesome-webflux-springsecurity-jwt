package com.dawn.awesomewebfluxspringsecurityjwt.router;

import com.dawn.awesomewebfluxspringsecurityjwt.handler.SysUserHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/
@Configuration
public class SysUserRouter {
    @Bean
    public RouterFunction<ServerResponse> userRouterHandler(SysUserHandler userHandler) {
        return RouterFunctions
                .route(RequestPredicates
                        .GET("/users/page/{pageNum}/{pageSize}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::pageUser)
                .andRoute(RequestPredicates
                        .GET("/users/{id}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::getUser)
                .andRoute(RequestPredicates
                        .POST("/signin")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::signin)
                .andRoute(RequestPredicates
                        .DELETE("/users/{id}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::deleteUser)
                .andRoute(RequestPredicates
                        .PUT("/users")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::updateUser)
                .andRoute(RequestPredicates
                        .POST("/users")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::saveUser)
                .andRoute(RequestPredicates
                        .PUT("/users/change_password")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), userHandler::changePassword)
                ;
    }

}
