package com.vole.controller.admin;

import com.vole.entity.Manager;
import com.vole.service.ManagerService;
import com.vole.util.CryptographyUtil;
import com.vole.util.ResponseUtil;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * 编写者： vole
 * Time： 2018/4/23.16:32
 * 内容：管理员Controller类
 */
@Controller
@RequestMapping("/admin/manager")
public class ManagerAdminController {

    @Resource
    private ManagerService managerService;

    /**
     * 修改管理员密码
     * @param newPassword
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyPassword")
    public String modifyPassword(String newPassword,HttpServletResponse response)throws Exception{
        Manager manager=new Manager();
        manager.setPassword(CryptographyUtil.md5(newPassword, CryptographyUtil.SALT));
        int resultTotal=managerService.update(manager);
        JSONObject result=new JSONObject();
        if(resultTotal>0){
            result.put("success", true);
        }else{
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    /**
     * 注销
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout")
    public String logout()throws Exception{
        SecurityUtils.getSubject().logout();
        return "redirect:/login.jsp";
    }
}
