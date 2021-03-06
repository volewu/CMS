package com.vole.service.impl;

import com.vole.dao.ManagerDao;
import com.vole.entity.Manager;
import com.vole.service.ManagerService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 编写者： vole
 * Time： 2018/4/12.16:33
 * 内容：用户管理服务接口实现类
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService{

    @Resource
    private ManagerDao managerDao;

    public Manager getByUserName(String userName) {
        return managerDao.getByUserName(userName);
    }

    public Integer update(Manager manager) {
        return managerDao.update(manager);
    }
}

