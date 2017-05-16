package com.lhd.service;

import com.baomidou.mybatisplus.service.IService;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 文章查询
 */
public interface IArticleService extends IService<Article> {

    /**
     * 分页查询对应类型的文章
     * @param paramMap
     * @return
     */
    List<ArticleDto> selectArticleList( Map<String, Object> paramMap);

    /**
     * 使用id查询
     * @return
     */
    ArticleDto selectArticle(@Param("articleId") String articleId);

    /**
     * 更新文章
     * @param article
     * @return
     */
    int updateArticle(Article article);
}
