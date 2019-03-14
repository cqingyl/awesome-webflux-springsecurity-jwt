package com.dawn.awesomewebfluxspringsecurityjwt.router;

import com.dawn.awesomewebfluxspringsecurityjwt.handler.ProductHandler;
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
public class ProductRouter {
    @Bean
    public RouterFunction<ServerResponse> productRouterHandler(ProductHandler productHandler) {
        return RouterFunctions
                .route(RequestPredicates
                        .POST("/pros/page/{pageNum}/{pageSize}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), productHandler::pageProduct)
                .andRoute(RequestPredicates
                        .GET("/pros/{id}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), productHandler::getProduct)
                .andRoute(RequestPredicates
                        .DELETE("/pros/{id}")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), productHandler::deleteProduct)
                .andRoute(RequestPredicates
                        .PUT("/pros")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), productHandler::updateProduct)
                .andRoute(RequestPredicates
                        .POST("/pros")
                        .and(RequestPredicates
                                .accept(MediaType
                                        .APPLICATION_JSON)), productHandler::saveProduct)
                ;
    }
}