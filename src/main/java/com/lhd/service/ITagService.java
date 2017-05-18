package com.lhd.service;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.IService;
import com.lhd.entity.Article;
import com.lhd.entity.ArticleTag;
import com.lhd.entity.SysUser;
import com.lhd.entity.Tag;

import java.util.List;

/**
 * Created by lhd on 2017/5/14.
 * 标签
 */
public interface ITagService extends IService<Tag> {

    /**
     * 是否存在对应tagName
     * @param tagName
     * @return
     */
    Integer selectCountByTagName(String tagName);

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
    Integer deleteArticleTag(String tagId);

    /**
     * 使用文章id查询所有对应的tagId
     * @param articleId
     * @return
     */
    List<String> selectTagIdByArticleId(String articleId);

}
