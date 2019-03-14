package com.dawn.awesomewebfluxspringsecurityjwt.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.ReactiveAuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/
@Component
public class AuthenticationManager implements ReactiveAuthenticationManager {

    @Autowired
    PBKDF2Encoder encoder;

    @Autowired
    MyReactiveUserDetailsService myReactiveUserDetailsService;

    @Override
    public Mono<Authentication> authenticate(Authentication authentication) {
        String authToken = authentication.getCredentials().toString();

        String username;
        try {
            username = JWTUtil.getUsernameFromToken(authToken);
        } catch (Exception e) {
            username = null;
        }
        if (username != null && JWTUtil.validateToken(authToken)) {
            return myReactiveUserDetailsService
                    .findByUsername(username)
                    .flatMap(userDetails ->
                            Mono.just(new UsernamePasswordAuthenticationToken(
                                    userDetails,
                                    null,
                                    userDetails.getAuthorities()
                            )));
        } else {
            return Mono.empty();
        }
    }
}
