package com.lhd.service;

import com.baomidou.mybatisplus.service.IService;
import com.lhd.entity.SysRole;

/**
 * Created by lhd on 2017/5/4.
 * 角色service
 */
public interface ISysRoleService extends IService<SysRole> {

    /**
     * 通过userid获取对应roleid
     * @param roleId
     * @return
     */
    String selectRoleIdByUserId(String roleId);
}
