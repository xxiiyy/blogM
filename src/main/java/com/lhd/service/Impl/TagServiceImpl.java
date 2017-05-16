package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import com.lhd.entity.Tag;
import com.lhd.mapper.ArticleMapper;
import com.lhd.mapper.TagMapper;
import com.lhd.service.IArticleService;
import com.lhd.service.ITagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 分类
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper,Tag> implements ITagService{

    @Autowired
    private TagMapper tagMapper;


}
