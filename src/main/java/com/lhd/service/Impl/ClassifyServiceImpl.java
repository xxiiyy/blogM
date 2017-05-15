package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.entity.Classify;
import com.lhd.mapper.ClassifyMapper;
import com.lhd.service.IClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by lhd on 2017/5/14.
 * 文章分类
 */
@Service
public class ClassifyServiceImpl extends ServiceImpl<ClassifyMapper,Classify> implements IClassifyService{



}
