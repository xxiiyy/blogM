package com.lhd.controller;

import com.lhd.dto.ArticleDto;
import com.lhd.entity.SysMenu;
import com.lhd.entity.SysUser;
import com.lhd.service.Impl.ArticleServiceImpl;
import com.lhd.service.Impl.SysMenuServiceImpl;
import com.lhd.service.Impl.SysRoleServiceImpl;
import com.lhd.service.Impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by lhd on 2017/5/7.
 * 基础controller设置
 */
@Controller
@RequestMapping("/")
public class BaseController {

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Autowired
    private SysMenuServiceImpl sysMenuService;

    @Autowired
    private ArticleServiceImpl articleService;

    @RequestMapping(value = {"", "index"})
    public String index(Model model) {
        String username = "admin";//暂时admin
        SysUser user = sysUserService.selectUserByUsername(username);
        List<String> menuIds = sysMenuService.selectMenuIdByRoleId(user.getRoleId());
        List<SysMenu> menus = new ArrayList<SysMenu>();
        for (String menuId : menuIds) {
            SysMenu sysMenu = sysMenuService.selectMenuByMenuId(menuId);
            if(sysMenu != null)
                menus.add(sysMenu);
        }
        List<SysMenu> pMenus = SysMenu.buildTree(menus);
        model.addAttribute("user", user);
        model.addAttribute("menus", pMenus);
        return "index";
    }

    @RequestMapping(value = "login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "welcome")
    public String welcome(){
        return "welcome";
    }

    public static void main(String[] args) {
        String id = UUID.randomUUID().toString().replaceAll("-","");
        System.out.println(id);
    }

    @RequestMapping(value = "test")
    public String test(Model model){
        ArticleDto articleDto = articleService.selectArticleDto("007e11c56dc44bf29ea2757fc838c2d2");
        model.addAttribute("article",articleDto);
        return "test";
    }

    @RequestMapping(value = "icon")
    public String icon(){
        return "icon";
    }
}
