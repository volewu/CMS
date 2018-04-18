package com.vole.service.impl;

import com.vole.dao.ArticleDao;
import com.vole.entity.Article;
import com.vole.service.ArticleService;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/16.10:20
 * 内容：帖子内容 Service 实现类
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleDao articleDao;

    public List<Article> getNewest() {
        return articleDao.getNewest();
    }

    public List<Article> getRecommend() {
        return articleDao.getRecommend();
    }

    public List<Article> getSlide() {
        return articleDao.getSlide();
    }

    public List<Article> getIndex(Integer typeId) {
        return articleDao.getIndex(typeId);
    }

    public Article findById(Integer id) {
        return articleDao.findById(id);
    }

    public Article getLastArticle(Integer id) {
        return articleDao.getLastArticle(id);
    }

    public Article getNextArticle(Integer id) {
        return articleDao.getNextArticle(id);
    }

    public Integer update(Article article) {
        return articleDao.update(article);
    }

    public List<Article> list(Map<String, Object> map) {
        return articleDao.list(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return articleDao.getTotal(map);
    }
}
