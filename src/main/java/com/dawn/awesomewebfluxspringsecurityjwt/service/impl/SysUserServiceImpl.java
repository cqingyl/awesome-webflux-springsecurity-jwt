package com.dawn.awesomewebfluxspringsecurityjwt.service.impl;

import com.dawn.awesomewebfluxspringsecurityjwt.config.exception.CommonException;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.CusPageRequest;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.PageInfo;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.SysUserChangePassword;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import com.dawn.awesomewebfluxspringsecurityjwt.enums.ResponseCode;
import com.dawn.awesomewebfluxspringsecurityjwt.repository.SysUserRepository;
import com.dawn.awesomewebfluxspringsecurityjwt.security.JWTUtil;
import com.dawn.awesomewebfluxspringsecurityjwt.security.PBKDF2Encoder;
import com.dawn.awesomewebfluxspringsecurityjwt.security.model.AuthResponse;
import com.dawn.awesomewebfluxspringsecurityjwt.service.ISysUserService;
import com.dawn.awesomewebfluxspringsecurityjwt.utils.CopyUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.ReactiveMongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Mono;

import javax.validation.Valid;
import java.util.List;

import static org.springframework.data.mongodb.core.query.Criteria.where;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Service("iSysUserService")
@Transactional(rollbackFor = Exception.class)
public class SysUserServiceImpl implements ISysUserService {
    @Autowired
    SysUserRepository sysUserRepository;
    @Autowired
    ReactiveMongoTemplate reactiveMongoTemplate;
    @Autowired
    PBKDF2Encoder encode;

    @Override
    public Mono<SysUser> get(String id) {
        return sysUserRepository.findById(id);
    }

    @Override
    public Mono<PageInfo> page(CusPageRequest pageRequest) {

        Query query = Query.query(where("_id").gt(pageRequest.getLastId())).limit(pageRequest.getPageSize());
        PageInfo<SysUser> of = new PageInfo<>();
        Mono<Long> count = reactiveMongoTemplate.count(query, SysUser.class)
                .doOnNext(c -> {
                    of.setTotal(Math.toIntExact(c));
                });
        Mono<List<SysUser>> sysUserFlux = reactiveMongoTemplate.find(query, SysUser.class)
                .collectList()
                .doOnNext(of::initList);
        return count.then(sysUserFlux).then(Mono.just(of));
    }

    @Override
    public Mono<AuthResponse> signin(String username, String password) {
        return findByUsernameAndPassword(username, password)
                .flatMap(user -> {
                    return Mono.justOrEmpty(new AuthResponse(JWTUtil.generateToken(user), username));
                })
                .switchIfEmpty(Mono.error(new CommonException(ResponseCode.INVALID_USER)));
    }

    public Mono<SysUser> findByUsernameAndPassword(String username, String password) {
        String encodePassword = encode.encode(password);
        return sysUserRepository.findByUsernameAndPassword(username, encodePassword);
    }

    @Override
    public Mono<Void> remove(String id) {
        return sysUserRepository.deleteById(id);
    }

    @Override
    public Mono<SysUser> update(SysUser user) {

        return sysUserRepository.findById(user.getId()).flatMap(resUser -> {
            resUser.setPassword(null);
            CopyUtils.copyPropertiesIgnoreNull(user, resUser);
            return sysUserRepository.save(resUser);
        });
    }

    @Override
    public Mono<SysUser> signup(SysUser user) {
        return sysUserRepository.save(user);
    }

    @Override
    public Mono<SysUser> changePassword(@Valid SysUserChangePassword sucp) {
        return sysUserRepository.findByUsername(sucp.getUsername())
                .filter(u -> encode.matches(sucp.getOldPassword(), u.getPassword()))
                .flatMap(su -> {
                    BeanUtils.copyProperties(sucp, su);
                    su.setPassword(encode.encode(sucp.getNewPassword()));
                    return sysUserRepository.save(su);
                });
    }

    @Override
    public Mono<SysUser> save(SysUser sysUser) {
        return Mono.justOrEmpty(sysUser).filter(su ->
                StringUtils.isNotBlank(su.getUsername()) &&
                        StringUtils.isNotBlank(su.getPassword())
        ).flatMap(su -> {
            String encodePassword = encode.encode(sysUser.getPassword());
            sysUser.setPassword(encodePassword);
            return sysUserRepository.save(sysUser);
        }).switchIfEmpty(Mono.error(new CommonException(ResponseCode.INVALID_USER)));
    }
}
