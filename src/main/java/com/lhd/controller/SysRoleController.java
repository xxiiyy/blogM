package com.lhd.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.dto.SysMenuDto;
import com.lhd.entity.SysRole;
import com.lhd.service.Impl.SysMenuServiceImpl;
import com.lhd.service.Impl.SysRoleServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lhd on 2017/5/4.
 * 角色controller
 */
@Controller
@RequestMapping("/role")
public class SysRoleController {

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    @Autowired
    private SysMenuServiceImpl sysMenuService;

    @RequestMapping(value = "/role-list")
    public String roleList(Model model){
        Page<SysRole> page = sysRoleService.selectPage(new Page<SysRole>());
        model.addAttribute("page",page);
        return "role/roleList";
    }

    @RequestMapping(value = "/role-delete/{id}")
    public String roleDelete(@PathVariable("id") String id){
        sysRoleService.deleteById(id);
        return "redirect:/role/role-list";
    }

    @RequestMapping(value = "/role-add")
    public String roleAdd(SysRole role){
        role.setId(StringUtils.getUUId());
        role.setUseable(true);
        role.setCreateBy("admin");
        role.setCreateTime(new Date());
        role.setUpdateBy("admin");
        role.setUpdateTime(new Date());
        sysRoleService.insert(role);
        return "redirect:/role/role-list";
    }

    @RequestMapping(value = "/role-update")
    public String roleUpdate(SysRole role){
        sysRoleService.updateRoleById(role);
        return "redirect:/role/role-list";
    }

    /**
     * ztree数据填充
     * @param roleId
     * @return
     */
    @RequestMapping(value = "/role-z-list/{roleId}",method = RequestMethod.POST)
    @ResponseBody
    public List<SysMenuDto> roleZtreeList(@PathVariable("roleId") String roleId){
        List<SysMenuDto> sysMenuDtos = sysMenuService.selectAllMenuDto();
        List<String> roleIds = sysMenuService.selectMenuIdByRoleId(roleId);
        List<String> rmIds;
        for (SysMenuDto sysMenuDto:sysMenuDtos){
            rmIds = new ArrayList<String>();
            for (String id:roleIds){
                if(id != null&&id.equals(sysMenuDto.getId())){
                    rmIds.add(id);
                    sysMenuDto.setChecked(true);
                    sysMenuDto.setOpen(true);
                }
            }
            roleIds.removeAll(rmIds);
        }
        return sysMenuDtos;
    }

    /**
     * 修改每种角色具有的menu
     * @param roleId
     * @param nodeIds
     * @return
     */
    @RequestMapping(value = "/role-z-update/{roleId}",method = RequestMethod.POST)
    @ResponseBody
    public Message roleZtreeUpdate(@PathVariable("roleId") String roleId,
                                   @RequestBody String nodeIds){
        Message message = new Message();
        int length = nodeIds.length();
        String[] menuIds = nodeIds.trim().substring(1,length-1).split(",");
        for (String menuId:menuIds){
            System.out.println(menuId);
        }
        int result = sysRoleService.roleMenuUpdate(menuIds, roleId);
        if(result != 0){
            message.setMessage("修改成功");
        }else{
            message.setMessage("修改失败");
        }
        return message;
    }


}
