package com.vole.controller.admin;

import com.vole.entity.Article;
import com.vole.entity.PageBean;
import com.vole.service.ArticleService;
import com.vole.service.impl.InitComponent;
import com.vole.util.DateUtil;
import com.vole.util.ResponseUtil;
import com.vole.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
     * @param article
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String add(@RequestParam("slideImageFile") MultipartFile slideImageFile, Article article,
                      HttpServletResponse response, HttpServletRequest request) throws Exception {
        int resultTotal; // 操作的记录条数
        article.setPublishDate(new Date());
        if (!slideImageFile.isEmpty()) {
            //获取绝对路径
            String filePath = request.getServletContext().getRealPath("/");
            //文件名转换 yyyyMMddhhmmss.原始后缀
            String imageName = DateUtil.getCurrentDateStr() + "." + slideImageFile.getOriginalFilename().split("\\.")[1];
            //文件上传在项目的位置
            slideImageFile.transferTo(new File(filePath + "static/userImages/" + imageName));
            article.setSlideImage(imageName);
//            System.out.println("-------" + imageName);
        }
        if (article.getId() == null) {//添加
            resultTotal = articleService.add(article);
        } else {//修改
            resultTotal = articleService.update(article);
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

    /**
     * 根据条件分页查询帖子
     * @param page
     * @param rows
     * @param response
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows,
                       Article article, HttpServletResponse response) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        System.err.println(page + "---" + rows + "--" + pageBean);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("title", StringUtil.formatLike(article.getTitle()));
        System.err.println(StringUtil.formatLike(article.getTitle()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Article> articleList = articleService.list(map);
        Long total = articleService.getTotal(map);
        JSONObject result = new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        //日期转换
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray = JSONArray.fromObject(articleList, jsonConfig);
        System.err.println(jsonArray);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 通过ID查找实体
     * @param id
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public String findById(@RequestParam(value = "id") String id, HttpServletResponse response) throws Exception {
        Article article = articleService.findById(Integer.parseInt(id));
        JSONObject result = JSONObject.fromObject(article);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 删除帖子
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        String[] idsStr = ids.split(",");
        for (String anIdsStr : idsStr) {
            articleService.delete(Integer.parseInt(anIdsStr));
        }
        initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
        JSONObject result = new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
