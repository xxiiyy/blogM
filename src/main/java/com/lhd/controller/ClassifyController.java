package com.lhd.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.Message;
import com.lhd.entity.Classify;
import com.lhd.service.Impl.ClassifyServiceImpl;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by lhd on 2017/5/15.
 * 分类
 */
@Controller
@RequestMapping("/classify")
public class ClassifyController {

    @Autowired
    private ClassifyServiceImpl classifyService;

    @RequestMapping(value = "/classify-list",method = RequestMethod.GET)
    public String classifyList(Model model){
        Page<Classify> page = classifyService.selectPage(
                new Page<Classify>(),new EntityWrapper<Classify>());
        model.addAttribute("page",page);
        return "classify/classifyList";
    }

    @RequestMapping(value = "/classify-add",method = RequestMethod.POST)
    public String classifyAdd(Classify classify){
        classify.setId(StringUtils.getUUId());
        classifyService.insert(classify);
        return "redirect:/classify/classify-list";
    }

    @RequestMapping(value = "/classify-delete/{id}")
    @ResponseBody
    public Message classifyDelete(@PathVariable("id") String id){
        Message message = new Message();
        boolean classifyResult = classifyService.deleteById(id);
        if(classifyResult == true) {
            message.setStatus(true);
            message.setMessage("删除成功");
        }else {
            message.setMessage("删除失败");
            message.setStatus(false);
        }
        return message;
    }

    @RequestMapping(value = "/classify-update",method = RequestMethod.POST)
    public String classifyUpdate(Classify classify){
        classifyService.updateById(classify);
        return "redirect:/classify/classify-list";
    }

}
