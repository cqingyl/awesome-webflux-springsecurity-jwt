package com.dawn.awesomewebfluxspringsecurityjwt.service;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.PageInfo;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.Product;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
public interface IProductService {
    Mono<Product> get(String id);

    Mono<PageInfo> page(CusPageRequest pageRequest);

    Mono<Void> remove(String id);

    Mono<Product> update(Product product);

    Mono<Product> save(Product product);
}
