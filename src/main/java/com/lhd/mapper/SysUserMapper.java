package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zhongmc on 2017/5/4.
 * 用户mapper
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 根据username获取user
     * @param username
     * @return
     */
    SysUser selectUserByUsername(@Param("username") String username);

    /**
     * 查询全部用户
     * @return
     */
    List<SysUser> selectAllUser();

    /**
     * 插入用户
     * @param user
     * @return
     */
    int insertUser(SysUser user);

    /**
     * 更新用户
     * @param user
     * @return
     */
    int updateUser(SysUser user);

}
