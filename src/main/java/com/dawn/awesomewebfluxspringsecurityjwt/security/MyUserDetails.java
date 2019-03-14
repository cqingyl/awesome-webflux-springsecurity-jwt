package com.dawn.awesomewebfluxspringsecurityjwt.security;

import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission;
import com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser;
import lombok.Data;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Author: Administrator
 * DATE: 2019/2/18
 * DESC:
 **/
@ToString
@Data
public class MyUserDetails implements UserDetails {

    private String username;
    private SysUser sysUser;
    private String password;
    private List<SysPermission> sysPermissions;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> auths = new ArrayList<>();
        List<SysPermission> permissions = this.getSysPermissions();
        for (SysPermission permission : permissions) {
            auths.add(new SimpleGrantedAuthority(permission.getDescription()));
        }
        return auths;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
