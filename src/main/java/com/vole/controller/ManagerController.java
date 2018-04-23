package com.vole.controller;

import com.vole.entity.Manager;
import com.vole.service.ManagerService;
import com.vole.util.CryptographyUtil;
import com.vole.util.ResponseUtil;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * 编写者： vole
 * Time： 2018/4/12.16:35
 * 内容：用户管理可能控制层
 */
@Controller
@RequestMapping("/manager2")
public class ManagerController {

    @Resource
    private ManagerService managerService;

    /**
     * 用户登录
     *
     * @param manager
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(Manager manager, HttpServletResponse response) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(manager.getUserName(), CryptographyUtil.md5(manager.getPassword(), CryptographyUtil.SALT));
        JSONObject result = new JSONObject();
        try {
            subject.login(token);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("errorInfo", "用户名或者密码错误！");
            e.printStackTrace();
        }
        ResponseUtil.write(response, result);
        return null;
    }

}
