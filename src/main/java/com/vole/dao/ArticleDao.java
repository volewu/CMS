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
}
