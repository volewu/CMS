package com.vole.dao;

import com.vole.entity.Article;

import java.util.List;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:10
 * 内容：帖子内容 DAO 接口
 */
public interface ArticleDao {

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
     * 根据帖子类别来查找最新的8条数据
     * @param typeId
     * @return
     */
    List<Article> getIndex(Integer typeId);
}
