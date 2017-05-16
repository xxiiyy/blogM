package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 文章查询
 */
public interface ArticleMapper extends BaseMapper<Article>{

    /**
     * 分页查询对应类型的文章
     * @param paramMap
     * @return
     */
    List<ArticleDto> selectArticleList( @Param("paramMap") Map<String, Object> paramMap);

    /**
     * 使用id查询
     * @return
     */
    ArticleDto selectArticleDto(@Param("articleId") String articleId);

    /**
     * 更新文章
     * @param article
     * @return
     */
    int updateArticle(Article article);
}
