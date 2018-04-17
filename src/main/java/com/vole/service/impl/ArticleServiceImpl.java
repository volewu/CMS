package com.vole.service.impl;

import com.vole.dao.ArticleDao;
import com.vole.entity.Article;
import com.vole.service.ArticleService;

import org.springframework.stereotype.Service;

import java.util.List;

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
}
