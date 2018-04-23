package com.vole.service;

import com.vole.entity.Manager;

/**
 * 编写者： vole
 * Time： 2018/4/12.16:32
 * 内容：用户管理服务类
 */
public interface ManagerService {

    /**
     * 通过用户名查询用户
     * @param userName
     * @return
     */
     Manager getByUserName(String userName);

    /**
     * 更新管理员信息
     * @param manager
     * @return
     */
    Integer update(Manager manager);
}
