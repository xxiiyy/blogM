package com.onion.mybatis;

import com.lhd.entity.SysMenu;
import com.lhd.entity.SysRoleMenu;
import com.lhd.entity.SysUser;
import com.lhd.service.Impl.SysMenuServiceImpl;
import com.lhd.service.Impl.SysRoleServiceImpl;
import com.lhd.service.Impl.SysUserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by zhongmc on 2017/5/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring/spring-dao.xml",
        "classpath:config/spring/spring-service.xml"})
public class AddData {

    @Autowired SysUserServiceImpl sysUserService;

    @Autowired
    private SysMenuServiceImpl sysMenuService;

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    @Test
    public void addMenu(){
        SysMenu sysMenu = new SysMenu();
        sysMenu.setCreateBy("admin");
        sysMenu.setUpdateBy("admin");
        sysMenu.setCreateTime(new Date());
        sysMenu.setUpdateTime(new Date());
        sysMenu.setMenuName("菜单管理");
        sysMenu.setIcon("fa fa-user");
        sysMenu.setpId("0");
        sysMenu.setUseable(true);
        sysMenu.setHref("#");
        sysMenuService.insert(sysMenu);
        SysRoleMenu roleMenu = new SysRoleMenu();
        String id = UUID.randomUUID().toString().replaceAll("-","");
        System.out.println(id);
        roleMenu.setId(id);
        System.err.println(UUID.randomUUID().toString());
        roleMenu.setMenuId(sysMenu.getId());
        roleMenu.setRoleId("4c3e861acaba449fa0103a7bad3c4ebw");
        sysMenuService.insertRoleMenu(roleMenu);
    }


    @Test
    public void addRoleMenu(){
        SysRoleMenu sysRoleMenu = new SysRoleMenu();
        sysRoleMenu.setRoleId("4c3e861acaba449fa0103a7bad3c4ebw");
        sysRoleMenu.setMenuId("f3c0864dd20547c1860b8d7961016db3");
//        sysRoleMenuService.insert(sysRoleMenu);
        String username = "admin";
        SysUser user = sysUserService.selectUserByUsername(username);
        List<String> menuIds = sysMenuService.selectMenuIdByRoleId(user.getRoleId());
        List<SysMenu> menus = new ArrayList<SysMenu>();
        for (String menuId : menuIds){
            SysMenu sysMenu = sysMenuService.selectMenuByMenuId(menuId);
            menus.add(sysMenu);
        }
        List<SysMenu> pMenus = SysMenu.buildTree(menus);
        System.out.println(pMenus);
        System.out.println(menus.size());
    }


}
