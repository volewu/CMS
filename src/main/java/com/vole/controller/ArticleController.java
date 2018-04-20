package com.vole.controller;

import com.vole.entity.ArcType;
import com.vole.entity.Article;
import com.vole.service.ArticleService;
import com.vole.util.NavUtil;
import com.vole.util.StringUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 编写者： vole
 * Time： 2018/4/18.09:30
 * 内容： 帖子内容管理类
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Resource
    private ArticleService articleService;

    /**
     * 根据条件查询帖子
     * @param id
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/{id}")
    public ModelAndView details(@PathVariable("id") Integer id, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        Article article = articleService.findById(id);
        String keyWords = article.getKeyWords();
        if (StringUtil.isNotEmpty(keyWords)) {
            String arr[] = keyWords.split(" ");
            mav.addObject("keyWords", StringUtil.filterWhite(Arrays.asList(arr)));
        } else
            mav.addObject("keyWords", keyWords);
        mav.addObject("article", article);
        ArcType arcType = article.getArcType();
        mav.addObject("navCode", NavUtil.genArticleNavigation(arcType.getTypeName(),
                arcType.getId(), article.getTitle()));
        article.setClick(article.getClick() + 1);
        articleService.update(article);
        mav.addObject("pageCode", getUpAndDownPageCode(articleService.getLastArticle(id), articleService.getNextArticle(id),
                request.getServletContext().getContextPath()));

        mav.setViewName("article");
        return mav;
    }

    public String getUpAndDownPageCode(Article lastArticle, Article nextArticle, String projectContext) {
        StringBuffer pageCode = new StringBuffer();
        if (lastArticle == null || lastArticle.getId() == null) {
            pageCode.append("<p>上一篇：没有了</p>");
        } else {
            pageCode.append("<p>上一篇：<a href='" + projectContext + "/article/" + lastArticle.getId() + ".html'>" + lastArticle.getTitle() + "</a></p>");
        }

        if (nextArticle == null || nextArticle.getId() == null) {
            pageCode.append("<p>下一篇：没有了</p>");
        } else {
            pageCode.append("<p>下一篇：<a href='" + projectContext + "/article/" + nextArticle.getId() + ".html'>" + nextArticle.getTitle() + "</a></p>");
        }
        return pageCode.toString();
    }


}
