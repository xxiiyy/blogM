package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.entity.SysRole;
import com.lhd.mapper.SysRoleMapper;
import com.lhd.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lhd on 2017/5/4.
 * 角色service实现类
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper,SysRole> implements ISysRoleService{

    @Autowired
    private SysRoleMapper sysRoleMapper;

    public String selectRoleIdByUserId(String roleId) {
        return sysRoleMapper.selectRoleIdByUserId(roleId);
    }
}
