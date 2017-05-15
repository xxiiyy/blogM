package com.onion.mybatis;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import com.lhd.service.Impl.ArticleServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.bouncycastle.asn1.x500.style.RFC4519Style.o;

/**
 * Created by lhd on 2017/5/14.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/spring/applicationContext-dao.xml",
        "classpath:config/spring/applicationContext-service.xml"})
public class BlogTest {

    @Autowired
    private ArticleServiceImpl articleService;


    @Test
    public void test(){
        Wrapper wrapper = new EntityWrapper();
        wrapper.where("id={0}","1");
        Page page = articleService.selectPage(new Page<Article>(0, 2), wrapper);
        System.out.println(page.getRecords());

    }


    @Test
    public void test1(){
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("startNo",0);
        map.put("pageSize",1);
        List<ArticleDto> articleDtos = articleService.selectArticleList(map);
        System.out.println(articleDtos);
    }

}