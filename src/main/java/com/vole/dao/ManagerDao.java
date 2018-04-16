package com.vole.dao;

import com.vole.entity.Manager;

/**
 * 编写者： vole
 * Time： 2018/4/12.16:32
 * 内容：用户 dao 接口
 */
public interface ManagerDao {

    /**
     * 通过用户名查询用户
     *
     * @param userName
     * @return
     */
     Manager getByUserName(String userName);

}
