package com.vole.service.impl;

import com.vole.entity.ArcType;
import com.vole.entity.Article;
import com.vole.entity.Link;
import com.vole.service.ArcTypeService;
import com.vole.service.ArticleService;
import com.vole.service.LinkService;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 编写者： vole
 * Time： 2018/4/16.15:12
 * 内容：初始化组件，用于系统缓存
 */
@Component("initComponet")
public class InitComponet implements ApplicationContextAware, ServletContextListener {

    //共享该对象
    private static ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        InitComponet.applicationContext = applicationContext;
    }

    //初始化时执行
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        refreshSystem(application);
    }

    /**
     * 刷新application缓存方法
     * @param application
     */
    private void refreshSystem(ServletContext application) {
        LinkService linkService = (LinkService) applicationContext.getBean("linkService");
        List<Link> linkList = linkService.list(null);
        application.setAttribute("linkList", linkList);

        ArcTypeService arcTypeService = (ArcTypeService) applicationContext.getBean("arcTypeService");
        List<ArcType> arcTypeList = arcTypeService.list(null);
        application.setAttribute("arcTypeList", arcTypeList);

        ArticleService articleService = (ArticleService) applicationContext.getBean("articleService");
        List<Article> newestArticleList = articleService.getNewest();
        application.setAttribute("newestArticleList", newestArticleList);

        List<Article> recommendArticleList = articleService.getRecommend();
        application.setAttribute("recommendArticleList", recommendArticleList);

        List<Article> slideArticleList = articleService.getSlide();
        application.setAttribute("slideArticleList", slideArticleList);

        List<Object> allIndexArticleList = new ArrayList<Object>();
        if (arcTypeList != null && arcTypeList.size() != 0) {
            for (ArcType anArcTypeList : arcTypeList) {
                List<Article> subArticleList = articleService.getIndex(anArcTypeList.getId());
                allIndexArticleList.add(subArticleList);
            }
        }
        application.setAttribute("allIndexArticleList", allIndexArticleList);
    }

    //销毁时执行
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
