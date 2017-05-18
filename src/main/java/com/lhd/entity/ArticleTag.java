package com.lhd.entity;

/**
 * Created by lhd on 2017/5/18.
 */
public class ArticleTag {

    private String id;

    private String tagId;

    private String articleId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    @Override
    public String toString() {
        return "ArticleTag{" +
                "id='" + id + '\'' +
                ", tagId='" + tagId + '\'' +
                ", articleId='" + articleId + '\'' +
                '}';
    }
}
