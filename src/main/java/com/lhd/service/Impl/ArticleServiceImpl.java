package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import com.lhd.mapper.ArticleMapper;
import com.lhd.service.IArticleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 文章查询
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper,Article> implements IArticleService{

    @Autowired
    private ArticleMapper articleMapper;

    public List<ArticleDto> selectArticleList(Map<String, Object> paramMap) {
        return articleMapper.selectArticleList(paramMap);
    }

    public ArticleDto selectArticleDto(String articleId) {
        return articleMapper.selectArticleDto(articleId);
    }

    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }

}
