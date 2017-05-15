package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.entity.SysRole;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lhd on 2017/5/4.
 * 角色mapper
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 通过userid获取对应roleid
     * @param roleId
     * @return
     */
    String selectRoleIdByUserId(@Param("userId") String userId);

}
