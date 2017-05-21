package com.lhd.security;

import com.lhd.entity.SysRole;
import com.lhd.entity.SysUser;
import com.lhd.service.Impl.SysRoleServiceImpl;
import com.lhd.service.Impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by lhd on 2017/5/21.
 */
public class MyUserDetailsService implements UserDetailsService {

    private List<GrantedAuthority> authorities;

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    public MyUserDetailsService(){
        authorities = new ArrayList<GrantedAuthority>();
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        try {
            SysUser sysUser = sysUserService.selectUserByUsername(username);
            SysRole sysRole = sysRoleService.selectById(sysUser.getRoleId());
            GrantedAuthority authority = new SimpleGrantedAuthority(sysRole.getRoleType());
            authorities.add(authority);
            return new User(sysUser.getUsername(),
                    sysUser.getPassword(), true,
                    authorities,sysUser.getSalt());
        } catch (EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("用户名或密码不正确");
        }
    }
}
