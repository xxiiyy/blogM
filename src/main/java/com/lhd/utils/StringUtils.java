package com.lhd.utils;

import java.util.UUID;

/**
 * Created by lhd on 2017/5/15.
 */
public class StringUtils {

    public static String getUUId(){
        String id = UUID.randomUUID().toString().replaceAll("-","");
        return id;
    }

}
