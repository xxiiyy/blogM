package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.entity.SysRole;
import com.lhd.entity.SysRoleMenu;
import com.lhd.mapper.SysMenuMapper;
import com.lhd.mapper.SysRoleMapper;
import com.lhd.service.ISysRoleService;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 角色service实现类
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper,SysRole> implements ISysRoleService{

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysMenuMapper sysMenuMapper;


    public List<SysRole> selectAllRole() {
        return sysRoleMapper.selectAllRole();
    }

    public int updateRoleById(SysRole role) {
        return sysRoleMapper.updateRoleById(role);
    }

    /**
     * 菜单权限修改
     * @param menuIds
     * @param roleId
     * @return
     */
    public int roleMenuUpdate(String[] menuIds,String roleId){
        sysMenuMapper.deleteMenuByRoleId(roleId);
        SysRoleMenu sysRoleMenu = new SysRoleMenu();
        int result = 0;
        for (String menuId:menuIds){
            sysRoleMenu.setId(StringUtils.getUUId());
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenu.setRoleId(roleId);
            result = sysMenuMapper.insertRoleMenu(sysRoleMenu);
        }
        return result;
    }

}
