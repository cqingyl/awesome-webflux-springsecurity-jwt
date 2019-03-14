package com.dawn.awesomewebfluxspringsecurityjwt.security;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Author: Administrator
 * DATE: 2019/1/31
 * DESC:
 **/

@Component
public class JWTUtil {

    public static String secret;

    @Value("${springbootwebfluxjjwt.jjwt.secret}")
    public void setSecret(String secret) {
        JWTUtil.secret = secret;
    }

    public static String expirationTime;

    @Value("${springbootwebfluxjjwt.jjwt.expiration}")
    public void setExpirationTime(String expirationTime) {
        JWTUtil.expirationTime = expirationTime;
    }

    public static Claims getAllClaimsFromToken(String token) {
        return Jwts.parser().setSigningKey(Base64.getEncoder().encodeToString(secret.getBytes())).parseClaimsJws(token).getBody();
    }

    public static String getUsernameFromToken(String token) {
        return getAllClaimsFromToken(token).getSubject();
    }

    public static Date getExpirationDateFromToken(String token) {
        return getAllClaimsFromToken(token).getExpiration();
    }

    private static Boolean isTokenExpired(String token) {
        final Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    public static String generateToken(SysUser user) {
        Map<String, Object> claims = new HashMap<>();
//		claims.put("role", user.getRoles());
        return doGenerateToken(claims, user.getUsername());
    }

    private static String doGenerateToken(Map<String, Object> claims, String username) {
        Long expirationTimeLong = Long.parseLong(expirationTime); //in second

        final Date createdDate = new Date();
        final Date expirationDate = new Date(createdDate.getTime() + expirationTimeLong * 1000);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(username)
                .setIssuedAt(createdDate)
                .setExpiration(expirationDate)
                .signWith(SignatureAlgorithm.HS512, Base64.getEncoder().encodeToString(secret.getBytes()))
                .compact();
    }

    public static Boolean validateToken(String token) {
        return !isTokenExpired(token);
    }

}
