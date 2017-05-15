package com.lhd.dto;

import java.util.Date;

/**
 * Created by lhd on 2017/5/14.
 * 博客文章
 */
public class ArticleDto {

    /**
     * 文章id，唯一标识
     */
    private String id;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章子标题
     */
    private String subtitle;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 文章作者
     */
    private String author;

    /**
     * 文章标签
     */
    private String tag;

    /**
     * 文章分类
     */
    private String classify;

    /**
     * 文章点击量
     */
    private Integer click;

    /**
     * 文章封面
     */
    private String cover;

    /**
     * 文章修改时间
     */
    private Date updateTime;

    /**
     * 文章提交时间
     */
    private Date createTime;

    /**
     * 文章修改者
     */
    private String updateBy;

    /**
     * 文章提交者
     */
    private String createBy;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", subtitle='" + subtitle + '\'' +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                ", tag='" + tag + '\'' +
                ", classify='" + classify + '\'' +
                ", click=" + click +
                ", cover='" + cover + '\'' +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                ", updateBy='" + updateBy + '\'' +
                ", createBy='" + createBy + '\'' +
                '}';
    }
}
