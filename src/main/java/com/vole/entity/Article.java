package com.vole.entity;

import java.util.Date;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:02
 * 内容：帖子内容类
 */
public class Article {

    private Integer id; // 编号
    private String title; // 标题
    private Date publishDate; // 发布日期 假如 修改帖子 发布日期也会更新
    private String content; // 帖子内容
    private String summary; // 帖子摘要
    private String titleColor = "black"; // 标题颜色 默认黑色
    private Integer click = 0; // 阅读次数 默认0
    private Integer isRecommend = 0; // 是否推荐帖子  1  是  0 否  默认 0
    private Integer isSlide = 0; // 是否是幻灯帖子 1 是  0 否 默认0
    private String slideImage; // 幻灯图片
    private ArcType arcType; // 帖子类型
    private String keyWords; // 关键字 中间空格隔开

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTitleColor() {
        return titleColor;
    }

    public void setTitleColor(String titleColor) {
        this.titleColor = titleColor;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    public Integer getIsSlide() {
        return isSlide;
    }

    public void setIsSlide(Integer isSlide) {
        this.isSlide = isSlide;
    }

    public String getSlideImage() {
        return slideImage;
    }

    public void setSlideImage(String slideImage) {
        this.slideImage = slideImage;
    }

    public ArcType getArcType() {
        return arcType;
    }

    public void setArcType(ArcType arcType) {
        this.arcType = arcType;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }
}
