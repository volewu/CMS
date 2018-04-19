package com.vole.controller.admin;

import com.vole.entity.Article;
import com.vole.service.ArticleService;
import com.vole.service.impl.InitComponent;
import com.vole.util.DateUtil;
import com.vole.util.ResponseUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 编写者： vole
 * Time： 2018/4/19.14:52
 * 内容：帖子后台管理层
 */
@Controller
@RequestMapping("/admin/article")
public class ArticleAdminController {

    @Resource
    private ArticleService articleService;

    @Resource
    private InitComponent initComponent;

    /**
     * 添加或者修改帖子信息
     *
     * @param article
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String add(@RequestParam("slideImageFile") MultipartFile slideImageFile, Article article,
                      HttpServletResponse response, HttpServletRequest request) throws Exception {
        int resultTotal = 0; // 操作的记录条数
        article.setPublishDate(new Date());
        // TODO: 2018/4/19  图片压缩 功能
        if (!slideImageFile.isEmpty()) {
            //获取绝对路径
            String filePath = request.getServletContext().getRealPath("/");
            //文件名转换 yyyyMMddhhmmss.原始后缀
            String imageName = DateUtil.getCurrentDateStr() + "." + slideImageFile.getOriginalFilename().split("\\.")[1];
            //文件上传在项目的位置
            slideImageFile.transferTo(new File(filePath + "static/userImages/" + imageName));
            article.setSlideImage(imageName);
            System.out.println("-------" + imageName);
        }
        if (article.getId() == null) {//添加
            resultTotal = articleService.add(article);
        } else {//修改

        }
        StringBuffer result = new StringBuffer();
        if (resultTotal > 0) {
            //调用刷新缓存
            initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
            result.append("<script language='javascript'>alert('提交成功');</script>");
            //可以优化该地方：返回提示是否继续写帖子
        } else {
            result.append("<script language='javascript'>alert('提交失败，请联系管理员');</script>");
        }
        ResponseUtil.write(response, result);
        return null;
    }
}