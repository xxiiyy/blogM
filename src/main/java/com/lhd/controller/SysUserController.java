package com.lhd.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.entity.SysRole;
import com.lhd.entity.SysUser;
import com.lhd.service.Impl.SysRoleServiceImpl;
import com.lhd.service.Impl.SysUserServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 系统用户controller
 */
@Controller
@RequestMapping(value = "/user")
public class SysUserController {

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    @RequestMapping(value = "/user-list",method = RequestMethod.GET)
    public String userList(Model model){
        Page<SysUser> page = new Page<SysUser>();
        List<SysUser> sysUsers = sysUserService.selectAllUser();
        page.setRecords(sysUsers);
        model.addAttribute("page",page);
        return "user/userList";
    }

    @RequestMapping(value = "/user-insert")
    public String userInsert(SysUser user){
        user.setId(StringUtils.getUUId());
        user.setCreateBy("admin");
        user.setUpdateBy("admin");
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setIcon("");
        sysUserService.insertUser(user);
        return "redirect:/user/user-list";
    }


    @RequestMapping(value = "/user-add")
    public String userAdd(Model model){
        List<SysRole> roles = sysRoleService.selectAllRole();
        model.addAttribute("roles",roles);
        return "user/userAdd";
    }

    @RequestMapping(value = "/user-detail/{username}")
    public String userDetail(Model model,@PathVariable("username") String username) {
        SysUser user = sysUserService.selectUserByUsername(username);
        List<SysRole> roles = sysRoleService.selectAllRole();
        model.addAttribute("roles",roles);
        model.addAttribute("user",user);
        return "user/userDetail";
    }

    @RequestMapping(value = "/user-update")
    public String userUpdate(SysUser user){
        user.setUpdateTime(new Date());
        user.setUpdateBy("admin");
        sysUserService.updateUser(user);
        return "redirect:/user/user-list";
    }

    @RequestMapping(value = "/user-delete/{id}")
    @ResponseBody
    public Message userDelete(@PathVariable("id") String id){
        Message message = new Message();
        sysUserService.deleteById(id);
        return message;
    }
}
