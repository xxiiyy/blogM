package com.lhd.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.entity.Classify;
import com.lhd.entity.Tag;
import com.lhd.service.Impl.TagServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by lhd on 2017/5/16.
 * 标签controller
 */

@Controller
@RequestMapping("/tag")
public class TagController {

    @Autowired
    private TagServiceImpl tagService;

    @RequestMapping(value = "/tag-list",method = RequestMethod.GET)
    public String tagList(Model model){
        Page<Tag> page = tagService.selectPage(
                new Page<Tag>(),new EntityWrapper<Tag>());
        model.addAttribute("page",page);
        return "tag/tagList";
    }

    @RequestMapping(value = "/tag-add")
    public String tagAdd(Tag tag){
        tag.setId(StringUtils.getUUId());
        tagService.insert(tag);
        return "redirect:/tag/tag-list";
    }

    @RequestMapping(value = "/tag-update")
    public String tagUpdate(Tag tag){
        tagService.updateById(tag);
        return "redirect:/tag/tag-list";
    }

    @RequestMapping(value = "/tag-delete/{id}")
    @ResponseBody
    public Message tagDelete(@PathVariable("id") String id){
        Message message = new Message();
        boolean tagResult = tagService.deleteById(id);
        tagService.deleteArticleTag(id);
        if(tagResult == true) {
            message.setMessage("删除成功");
        }else {
            message.setMessage("删除失败");
        }
        return message;
    }

    public static void main(String[] args) {
        MessageDigestPasswordEncoder mdpe = new MessageDigestPasswordEncoder("md5");
        String s = mdpe.encodePassword("admin", "salt");
        System.out.println(s);
    }

}
