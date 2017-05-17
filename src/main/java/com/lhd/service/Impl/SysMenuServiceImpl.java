package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.dto.SysMenuDto;
import com.lhd.entity.SysMenu;
import com.lhd.entity.SysRoleMenu;
import com.lhd.mapper.SysMenuMapper;
import com.lhd.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 菜单service实现类
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper,SysMenu> implements ISysMenuService{


    @Autowired
    private SysMenuMapper sysMenuMapper;

    public List<String> selectMenuIdByRoleId(String roleId) {
        return sysMenuMapper.selectMenuIdByRoleId(roleId);
    }

    public SysMenu selectMenuByMenuId(String menuId) {
        return sysMenuMapper.selectMenuByMenuId(menuId);
    }

    public int insertRoleMenu(SysRoleMenu roleMenu) {
        return sysMenuMapper.insertRoleMenu(roleMenu);
    }

    public List<SysMenuDto> selectAllMenuDto() {
        return sysMenuMapper.selectAllMenuDto();
    }

    public int deleteMenuByRoleId(String roleId) {
        return sysMenuMapper.deleteMenuByRoleId(roleId);
    }

    public List<SysMenu> selectAllMenu() {
        return sysMenuMapper.selectAllMenu();
    }

    public int updateMenu(SysMenu menu) {
        return sysMenuMapper.updateMenu(menu);
    }

    public SysMenu selectMenuById(String id) {
        return sysMenuMapper.selectMenuById(id);
    }
}
