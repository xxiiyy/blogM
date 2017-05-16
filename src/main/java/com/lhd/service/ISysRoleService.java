package com.lhd.service;

import com.baomidou.mybatisplus.service.IService;
import com.lhd.entity.SysRole;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 角色service
 */
public interface ISysRoleService extends IService<SysRole> {


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
