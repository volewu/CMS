package com.vole.entity;

/**
 * 编写者： Wu
 * Time： 2018/4/12.16:31
 * 内容：Manager 用户管理实现类
 */
public class Manager {

    private Integer id;

    private String userName;

    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
