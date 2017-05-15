package com.lhd.service;

import com.baomidou.mybatisplus.service.IService;
import com.lhd.entity.SysMenu;
import com.lhd.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 菜单service
 */
public interface ISysMenuService extends IService<SysMenu> {


    /**
     * 通过roleid对应的全部menuid
     * @param roleId
     * @return
     */
    List<String> selectRoleIdByUserId(String roleId);

    /**
     * 通过menuid获取对应menu
     * @param menuId
     * @return
     */
    SysMenu selectMenuByMenuId(@Param("menuId") String menuId);


    int insertRoleMenu(SysRoleMenu roleMenu);

}
