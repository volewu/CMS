package com.vole.controller.admin;

import com.vole.entity.ArcType;
import com.vole.entity.PageBean;
import com.vole.service.ArcTypeService;
import com.vole.service.ArticleService;
import com.vole.service.impl.InitComponent;
import com.vole.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;


/**
 * 编写者： vole
 * Time： 2018/4/23.13:37
 * 内容：帖子类别后台管理
 */
@Controller
@RequestMapping("/admin/arcType")
public class ArcTypeAdminController {

    @Resource
    private ArcTypeService arcTypeService;

    @Resource
    private InitComponent initComponent;

    @Resource
    private ArticleService articleService;


    /**
     * 分页查询帖子类别
     *
     * @param page
     * @param rows
     * @param response
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", required = false) String page,
                       @RequestParam(value = "rows", required = false) String rows,
                       HttpServletResponse response) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<ArcType> arcTypeList = arcTypeService.list(map);
        System.err.println(arcTypeList);
        Long total = arcTypeService.getTotal(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(arcTypeList);
        System.err.println(jsonArray);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 添加或者修改帖子类别信息
     *
     * @param arcType
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(ArcType arcType, HttpServletResponse response) throws Exception {
        int resultTotal; // 操作的记录条数
        System.err.println(arcType);
        if (arcType.getId() == null)  // 添加
            resultTotal = arcTypeService.add(arcType);
        else  // 修改
            resultTotal = arcTypeService.update(arcType);

        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 删除帖子类别信息
     *
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        String[] idsStr = ids.split(",");
        JSONObject result = new JSONObject();
        for (String anIdsStr : idsStr) {
            if (articleService.getNumByTypeId(Integer.parseInt(anIdsStr)) > 0)
                result.put("exist", "帖子类别下有帖子，不能删除！");
            else
                arcTypeService.delete(Integer.parseInt(anIdsStr));

        }
        initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
