package com.lhd.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.entity.Classify;
import com.lhd.entity.Friend;
import com.lhd.service.Impl.FriendServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by lhd on 2017/5/17.
 * 友链
 */
@Controller
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    private FriendServiceImpl friendService;

    @RequestMapping(value = "/friend-list",method = RequestMethod.GET)
    public String friendList(Model model){
        Page<Friend> page = friendService.selectPage(
                new Page<Friend>(),new EntityWrapper<Friend>());
        model.addAttribute("page",page);
        return "friend/friendList";
    }

    @RequestMapping(value = "/friend-add",method = RequestMethod.POST)
    public String friendAdd(Friend friend){
        friend.setId(StringUtils.getUUId());
        friendService.insert(friend);
        return "redirect:/friend/friend-list";
    }

    @RequestMapping(value = "/friend-delete/{id}")
    @ResponseBody
    public Message friendDelete(@PathVariable("id") String id){
        Message message = new Message();
        boolean friendResult = friendService.deleteById(id);
        if(friendResult == true) {
            message.setMessage("删除成功");
        }else {
            message.setMessage("删除失败");
            message.setStatus(false);
        }
        return message;
    }

    @RequestMapping(value = "/friend-update",method = RequestMethod.POST)
    public String friendUpdate(Friend friend){
        friendService.updateById(friend);
        return "redirect:/friend/friend-list";
    }
}
