package com.vole.entity;

/**
 * 编写者： vole
 * Time： 2018/4/16.09:58
 * 内容：帖子类别实体
 */
public class ArcType {

    private Integer id; //编号
    private String typeName; // 类别名称
    private Integer sortNo;  // 排列序号
    private String keywords; // 关键字 页面 seo 用到
    private String description; // 类别描述 页面seo用到

    public ArcType(Integer id, String typeName, Integer sortNo, String keywords, String description) {
        this.id = id;
        this.typeName = typeName;
        this.sortNo = sortNo;
        this.keywords = keywords;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ArcType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                ", sortNo=" + sortNo +
                ", keywords='" + keywords + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
