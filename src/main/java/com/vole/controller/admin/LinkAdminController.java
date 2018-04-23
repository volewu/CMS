package com.vole.controller.admin;

import com.vole.entity.Link;
import com.vole.entity.PageBean;
import com.vole.service.LinkService;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 编写者： vole
 * Time： 2018/4/23.13:37
 * 内容：友情链接后台管理
 */
@Controller
@RequestMapping("/admin/link")
public class LinkAdminController {

    @Resource
    private LinkService linkService;

    @Resource
    private InitComponent initComponent;

    /**
     * 根据条件分页查询帖子友情链接
     * @param page
     * @param rows
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Link> linkList=linkService.list(map);
        Long total=linkService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(linkList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 添加或者修改帖子友情链接
     * @param link
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    public String save(Link link,HttpServletResponse response,HttpServletRequest request)throws Exception{
        int resultTotal=0; // 操作的记录条数
        if(link.getId()==null){ // 添加
            resultTotal=linkService.add(link);
        }else{ // 修改
            resultTotal=linkService.update(link);
        }
        JSONObject result=new JSONObject();
        if(resultTotal>0){
            initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
            result.put("success", true);
        }else{
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 删除友情链接
     * @param ids
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
        String []idsStr=ids.split(",");
        JSONObject result=new JSONObject();
        for (String anIdsStr : idsStr) {
            linkService.delete(Integer.parseInt(anIdsStr));
        }
        initComponent.refreshSystem(ContextLoader.getCurrentWebApplicationContext().getServletContext());
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}

