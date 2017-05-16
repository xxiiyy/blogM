package com.lhd.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lhd.dto.ArticleDto;
import com.lhd.entity.Article;
import com.lhd.entity.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lhd on 2017/5/14.
 * 标签
 */
public interface TagMapper extends BaseMapper<Tag>{


}
