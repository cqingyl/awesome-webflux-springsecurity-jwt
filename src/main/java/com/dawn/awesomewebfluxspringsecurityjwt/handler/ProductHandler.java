package com.dawn.awesomewebfluxspringsecurityjwt.handler;

import com.dawn.awesomewebfluxspringsecurityjwt.common.Result;
import com.dawn.awesomewebfluxspringsecurityjwt.config.exception.CommonException;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.Product;
import com.dawn.awesomewebfluxspringsecurityjwt.enums.ResponseCode;
import com.dawn.awesomewebfluxspringsecurityjwt.service.IProductService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import static org.springframework.http.MediaType.APPLICATION_JSON;


/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/
@Log4j2
@Configuration
public class ProductHandler {
    @Autowired
    IProductService iProductService;

    // 获取产品
    @PreAuthorize("hasAnyAuthority('ROLE_QUERY_PRODUCT')")
    public Mono<ServerResponse> getProduct(ServerRequest request) {
        String id = request.pathVariable("id");
        return iProductService.get(id)
                .flatMap(product -> ServerResponse
                        .ok()
                        .contentType(APPLICATION_JSON)
                        .syncBody(Result.createBySuccess(product)))
                .switchIfEmpty(Mono.error(new CommonException(ResponseCode.GET_ERROR)));
    }

    // 获取产品分页
    @PreAuthorize("hasAnyAuthority('ROLE_QUERY_PRODUCT')")
    public Mono<ServerResponse> pageProduct(ServerRequest request) {
        return request.bodyToMono(CusPageRequest.class)
                .defaultIfEmpty(new CusPageRequest())
                .flatMap(pageRequest -> iProductService
                        .page(pageRequest)
                        .flatMap(pageInfo -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess(pageInfo))));

    }

    // 删除产品
    @PreAuthorize("hasAnyAuthority('ROLE_DELETE_PRODUCT')")
    public Mono<ServerResponse> deleteProduct(ServerRequest request) {
        String id = request.pathVariable("id");
        return iProductService
                .remove(id)
                .flatMap(v -> ServerResponse
                        .ok()
                        .contentType(APPLICATION_JSON)
                        .syncBody(Result.createBySuccess()));
    }

    // 更新产品
    @PreAuthorize("hasAnyAuthority('ROLE_UPDATE_PRODUCT')")
    public Mono<ServerResponse> updateProduct(ServerRequest request) {
        return request.bodyToMono(Product.class)
                .flatMap(product -> iProductService
                        .update(product)
                        .flatMap(res -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess()))
                        .switchIfEmpty(Mono.error(new CommonException(ResponseCode.UPDATE_ERROR))));

    }

    // 添加产品
    @PreAuthorize("hasAnyAuthority('ROLE_CREATE_PRODUCT')")
    public Mono<ServerResponse> saveProduct(ServerRequest request) {
        return request
                .bodyToMono(Product.class)
                .flatMap(product -> iProductService
                        .save(product)
                        .flatMap(res -> ServerResponse
                                .ok()
                                .contentType(APPLICATION_JSON)
                                .syncBody(Result.createBySuccess()))
                        .switchIfEmpty(Mono.error(new CommonException(ResponseCode.INSERT_ERROR))));
    }
}
