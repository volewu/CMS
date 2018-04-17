package com.vole.service;

import com.vole.entity.Article;

import java.util.List;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:17
 * 内容：帖子内容 Service 接口
 */
public interface ArticleService {

    /**
     * 获取最新的 7 条帖子
     * @return
     */
    List<Article> getNewest();

    /**
     * 获取站长推荐的最新 7 条帖子
     * @return
     */
    List<Article> getRecommend();

    /**
     * 获取幻灯片的最新 5 条帖子
     * @return
     */
    List<Article> getSlide();

    /**
     * 根据帖子类别来查找最新的 8 条数据
     * @param typeId
     * @return
     */
    List<Article> getIndex(Integer typeId);
}
