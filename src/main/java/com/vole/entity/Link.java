package com.vole.entity;

/**
 * 编写者： vole
 * Time： 2018/4/16.09:55
 * 内容： 友情链接实体类
 */
public class Link {

    private Integer id;
    private String name;
    private String url;
    private Integer sortNo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }
}
