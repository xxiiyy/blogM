package com.lhd.utils;

import java.util.UUID;

/**
 * Created by lhd on 2017/5/15.
 * string工具类
 */
public class StringUtils {

    /**
     * 获取uuid
     * @return
     */
    public static String getUUId(){
        String id = UUID.randomUUID().toString().replaceAll("-","");
        return id;
    }

}
