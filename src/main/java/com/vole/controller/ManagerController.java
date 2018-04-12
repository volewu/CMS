package com.vole.controller;

import com.vole.service.ManagerService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 编写者： Wu
 * Time： 2018/4/12.16:35
 * 内容：用户管理可能控制层
 */
@Controller
@RequestMapping("Manager2")
public class ManagerController {

    @Resource
    private ManagerService managerService;
}
