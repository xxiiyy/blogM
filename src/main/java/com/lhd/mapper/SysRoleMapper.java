package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.entity.SysRole;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 角色mapper
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {


    /**
     * 查询可用的role
     * @return
     */
    List<SysRole> selectAllRole();

    /**
     * 更新数据
     * @param role
     * @return
     */
    int updateRoleById(SysRole role);



}
