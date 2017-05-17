package com.lhd.service.Impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lhd.entity.Classify;
import com.lhd.entity.Friend;
import com.lhd.mapper.ClassifyMapper;
import com.lhd.mapper.FriendMapper;
import com.lhd.service.IClassifyService;
import com.lhd.service.IFriendService;
import org.springframework.stereotype.Service;


/**
 * Created by lhd on 2017/5/14.
 * 友链service
 */
@Service
public class FriendServiceImpl extends ServiceImpl<FriendMapper,Friend> implements IFriendService{



}
