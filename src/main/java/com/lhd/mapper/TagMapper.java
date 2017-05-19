package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import com.lhd.entity.ArticleTag;
import com.lhd.entity.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 标签
 */
public interface TagMapper extends BaseMapper<Tag>{

    /**
     * 是否存在对应tagName
     * @param tagName
     * @return
     */
    Integer selectCountByTagName(@Param("tagName") String tagName);

    /**
     * 插入articleTag
     * @param articleTag
     * @return
     */
    Integer insertArticleTag(ArticleTag articleTag);

    /**
     * 根据tagId删除文章的标签
     * @param tagId
     * @return
     */
    Integer deleteArticleTag(@Param("tagId") String tagId);

    /**
     * 使用文章id查询所有对应的tagId
     * @param articleId
     * @return
     */
    List<String> selectTagIdByArticleId(@Param("articleId") String articleId);

    /**
     * 使用tagName获取tag
     * @param tagName
     * @return
     */
    Tag selectTagByTagName(@Param("tagName") String tagName);

    /**
     * 查看是否存在这么一条articletag
     * @param paramMap
     * @return
     */
    ArticleTag selectArticleTagExist(@Param("paramMap") Map<String,String> paramMap);
}
