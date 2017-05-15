package com.lhd.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * Created by lhd on 2017/5/14.
 * 标签信息
 */
@TableName("sys_classify")
public class Classify {

    /**
     * 标签id
     */
    @TableId(type = IdType.UUID)
    private String id;

    /**
     * 文章标签名
     */
    private String classify;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    @Override
    public String toString() {
        return "Classify{" +
                "id='" + id + '\'' +
                ", classify='" + classify + '\'' +
                '}';
    }
}
