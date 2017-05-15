package com.lhd.service;

import com.baomidou.mybatisplus.service.IService;
import com.lhd.entity.SysUser;

import java.util.List;

/**
 * Created by zhongmc on 2017/5/4.
 * 用户service
 * 由于用户的成员变量有一个对象，使用mybatis-plus没办法映射，所以有些需要自己写
 */
public interface ISysUserService extends IService<SysUser> {

    /**
     * 使用用户名查询对应用户信息
     * @param username
     * @return
     */
    SysUser selectUserByUsername(String username);

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
