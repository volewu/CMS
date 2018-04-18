package com.vole.controller;

import com.vole.entity.ArcType;
import com.vole.entity.Article;
import com.vole.entity.PageBean;
import com.vole.service.ArcTypeService;
import com.vole.service.ArticleService;
import com.vole.util.NavUtil;
import com.vole.util.PageUtil;
import com.vole.util.PropertiesUtil;
import com.vole.util.StringUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/18.16:14
 * 内容：帖子类别控制层
 */
@Controller
@RequestMapping("/arcType")
public class ArcTypeController {

    @Resource
    private ArcTypeService arcTypeService;

    @Resource
    private ArticleService articleService;

    @RequestMapping("/{id}")
    public ModelAndView list(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) String page) throws Exception {
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        if (StringUtil.isEmpty(page))
            page = "1";
        PageBean pageBean = new PageBean(Integer.parseInt(page),
                Integer.parseInt(PropertiesUtil.getValue("listPageSize")));
        map.put("typeId", id);
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Article> articleList = articleService.list(map);
        Long total = articleService.getTotal(map);
        ArcType arcType = arcTypeService.findById(id);
        mav.addObject("arcType", arcType);
        mav.addObject("articleList", articleList);
        mav.addObject("navCode", NavUtil.genArticleListNavigation(arcType.getTypeName()));
        mav.addObject("pageCode", PageUtil.genUpAndDownPagation(total.intValue(),
                Integer.parseInt(page),
                Integer.parseInt(PropertiesUtil.getValue("listPageSize")),
                String.valueOf(id)));
        mav.setViewName("articleList");
        return mav;
    }

}
