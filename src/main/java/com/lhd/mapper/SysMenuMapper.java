package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.dto.SysMenuDto;
import com.lhd.entity.SysMenu;
import com.lhd.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 菜单mapper
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 通过roleid对应的全部menuid
     * @param roleId
     * @return
     */
    List<String> selectMenuIdByRoleId(@Param("roleId") String roleId);


    /**
     * 通过menuid获取对应menu
     * @param menuId
     * @return
     */
    SysMenu selectMenuByMenuId(@Param("menuId") String menuId);

    /**
     * 插入rolemenu数据
     */
    int insertRoleMenu(@Param("roleMenu") SysRoleMenu roleMenu);

    /**
     * 获取ztree使用的dto
     * @return
     */
    List<SysMenuDto> selectAllMenuDto();

    /**
     * 删除menu
     * @param roleId
     * @return
     */
    int deleteMenuByRoleId(@Param("roleId") String roleId);
}
