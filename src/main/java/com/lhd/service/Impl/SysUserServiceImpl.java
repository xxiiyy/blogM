package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.entity.SysUser;
import com.lhd.mapper.SysRoleMapper;
import com.lhd.mapper.SysUserMapper;
import com.lhd.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhongmc on 2017/5/4.
 * 用户serivice实现类
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    public SysUser selectUserByUsername(String username) {
        return sysUserMapper.selectUserByUsername(username);
    }

    public List<SysUser> selectAllUser() {
        return sysUserMapper.selectAllUser();
    }

    public int insertUser(SysUser user) {
        return sysUserMapper.insertUser(user);
    }

    public int updateUser(SysUser user) {
        return sysUserMapper.updateUser(user);
    }


}
