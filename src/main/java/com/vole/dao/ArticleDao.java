package com.vole.dao;

import com.vole.entity.Article;

import java.util.List;
import java.util.Map;

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

    /**
     * 根据 id 查询帖子
     * @param id
     * @return
     */
    Article findById(Integer id);

    /**
     * 通过 id 得到上一篇帖子
     * @param id
     * @return
     */
    Article getLastArticle(Integer id);

    /**
     * 通过 id 得到下一篇帖子
     * @param id
     * @return
     */
    Article getNextArticle(Integer id);

    /**
     * 更新帖子
     * @param article
     * @return
     */
    Integer update(Article article);

    /**
     * 根据条件分页查询帖子
     * @param map
     * @return
     */
    List<Article> list(Map<String,Object> map);

    /**
     * 获取总记录数
     * @param map
     * @return
     */
    Long getTotal(Map<String,Object> map);

    /**
     * 添加帖子
     * @param article
     * @return
     */
    Integer add(Article article);

    /**
     * 删除帖子
     * @param id
     * @return
     */
    Integer delete(Integer id);

    /**
     * 查询指定类别下的帖子数量
     * @param typeId
     * @return
     */
    Integer getNumByTypeId(Integer typeId);
}