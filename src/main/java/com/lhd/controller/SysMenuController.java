package com.lhd.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.dto.SysMenuDto;
import com.lhd.entity.SysMenu;
import com.lhd.entity.SysRole;
import com.lhd.entity.SysUser;
import com.lhd.service.Impl.SysMenuServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 菜单controller
 */
@Controller
@RequestMapping("/menu")
public class SysMenuController {

    @Autowired
    private SysMenuServiceImpl sysMenuService;


    @RequestMapping(value = "/menu-list")
    public String menuList(Model model){
        Page<SysMenu> page = new Page<SysMenu>();
        List<SysMenu> menus = sysMenuService.selectAllMenu();
        page.setRecords(menus);
        model.addAttribute("page",page);
        return "menu/menuList";
    }


    @RequestMapping(value = "/menu-add")
    public String userAdd(){
        return "menu/menuAdd";
    }

    @RequestMapping(value = "/menu-insert")
    public String userInsert(SysMenu menu){
        menu.setId(StringUtils.getUUId());
        menu.setUpdateTime(new Date());
        menu.setCreateTime(new Date());
        menu.setCreateBy("admin");
        menu.setUpdateBy("admin");
        menu.setUseable(true);
        sysMenuService.insert(menu);
        return "redirect:/menu/menu-list";
    }

    @RequestMapping(value = "/menu-delete/{id}")
    @ResponseBody
    public Message menuDelete(@PathVariable("id") String id){
        Message message = new Message();
        sysMenuService.deleteById(id);
        return message;
    }

    @RequestMapping(value = "/menu-detail/{id}")
    public String menuDetail(Model model,@PathVariable("id") String id){
        SysMenu menu = sysMenuService.selectMenuById(id);
        model.addAttribute("menu",menu);
        return "menu/menuDetail";
    }

    @RequestMapping(value = "/menu-update")
    public String menuUpdate(SysMenu menu){
        sysMenuService.updateMenu(menu);
        return "redirect:/menu/menu-list";
    }
}
