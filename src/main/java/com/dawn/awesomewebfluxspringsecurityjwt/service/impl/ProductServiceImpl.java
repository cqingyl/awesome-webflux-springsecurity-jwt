package com.dawn.awesomewebfluxspringsecurityjwt.service.impl;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.PageInfo;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.Product;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.ProductRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.service.IProductService;
import com.dawn.awesomewebfluxspringsecurityjwt.utils.CopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.ReactiveMongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import java.util.List;

import static org.springframework.data.mongodb.core.query.Criteria.where;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Service("iProductService")
@Transactional(rollbackFor = Exception.class)
public class ProductServiceImpl implements IProductService {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ReactiveMongoTemplate reactiveMongoTemplate;

    @Override
    public Mono<Product> get(String id) {
        return productRepository.findById(id);
    }

    @Override
    public Mono<PageInfo> page(CusPageRequest pageRequest) {

        Query query = Query.query(where("_id").gt(pageRequest.getLastId())).limit(pageRequest.getPageSize());
        PageInfo<Product> of = new PageInfo<>();
        Mono<Long> count = reactiveMongoTemplate.count(query, Product.class)
                .doOnNext(c -> {
                    of.setTotal(Math.toIntExact(c));
                });
        Mono<List<Product>> productFlux = reactiveMongoTemplate.find(query, Product.class)
                .collectList()
                .doOnNext(of::initList);
        return count.then(productFlux).then(Mono.just(of));
    }

    @Override
    public Mono<Void> remove(String id) {
        return productRepository.deleteById(id);
    }

    @Override
    public Mono<Product> update(Product product) {
        return productRepository.findById(product.getId()).flatMap(resPro -> {
            CopyUtils.copyPropertiesIgnoreNull(product, resPro);
            return productRepository.save(resPro);
        });
    }

    @Override

    public Mono<Product> save(Product product) {
        return productRepository.save(product);
    }
}
