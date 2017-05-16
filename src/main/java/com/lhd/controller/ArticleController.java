package com.lhd.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.ArticleDto;
import com.lhd.dto.Message;
import com.lhd.entity.Article;
import com.lhd.entity.Classify;
import com.lhd.service.Impl.ArticleServiceImpl;
import com.lhd.service.Impl.ClassifyServiceImpl;
import com.lhd.utils.PageUtils;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * Created by lhd on 2017/5/13.
 */

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private ClassifyServiceImpl classifyService;

    @RequestMapping(value = "/article-list",method = RequestMethod.GET)
    public String articleList(Model model,String pageNo){
        int currentNo = 1;
        if(pageNo != null) currentNo = Integer.parseInt(pageNo);
        Page<ArticleDto> page = new Page<ArticleDto>();
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("startNo",(currentNo-1)*5);
        map.put("pageSize",5);
        List<ArticleDto> articleDtos = articleService.selectArticleList(map);
        page.setRecords(articleDtos);
        page.getCondition().put("pagination", getPage(currentNo));
        model.addAttribute("page",page);
        return "article/articleList";
    }

    private String getPage(int currentPageNo){
        Wrapper wrapper = new EntityWrapper();
        int count = articleService.selectCount(wrapper);
        String pagination = PageUtils.getPagination(
                currentPageNo, "/article/article-list", "", ((count-1)/5)+1);
        return pagination;
    }

    @RequestMapping(value = "/article-add")
    public String articleAdd(Model model){
        List<Classify> classifies = classifyService.selectList(new EntityWrapper<Classify>());
        model.addAttribute("classifies",classifies);
        return "article/articleAdd";
    }

    @RequestMapping(value = "/article-insert",method = RequestMethod.POST)
    public String articleInsert(Article article){
        article.setId(StringUtils.getUUId());
        article.setClick(0);
        article.setCreateTime(new Date());
        article.setUpdateTime(new Date());
        article.setCreateBy("admin");
        article.setUpdateBy("admin");
        articleService.insert(article);
        return "redirect:/article/article-list";
    }

    @RequestMapping(value = "/article-delete/{articleId}")
    @ResponseBody
    public Message articleDelete(@PathVariable("articleId") String articleId){
        Message message = new Message();
        boolean b = articleService.deleteById(articleId);
        if(b == true){
            message.setMessage("删除成功");
            message.setStatus(true);
        }else{
            message.setMessage("删除失败");
            message.setStatus(false);
        }
        return message;
    }


    @RequestMapping(value = "/article-detail/{articleId}",method = RequestMethod.GET)
    public String articleDetail(Model model,@PathVariable("articleId") String articleId){
        Article article = articleService.selectById(articleId);
        List<Classify> classifies = classifyService.selectList(new EntityWrapper<Classify>());
        article.setContent(article.getContent().trim());
        model.addAttribute("classifies",classifies);
        model.addAttribute("article",article);
        return "article/articleDetail";
    }

    @RequestMapping(value = "/article-update")
    public String articleUpdate(Article article){
        article.setUpdateBy("admin");
        article.setUpdateTime(new Date());
        System.out.println(article);
        articleService.updateArticle(article);
        return "redirect:/article/article-list";
    }


}
