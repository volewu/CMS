package com.vole.util;

/**
 * 编写者： vole
 * Time： 2018/4/18.10:35
 * 内容：导航工具类
 */
public class NavUtil {

    /**
     * 生成帖子详细页导航
     * @param typeName
     * @param typeId
     * @param articleTitle
     * @return
     */
    public static String genArticleNavigation(String typeName, Integer typeId, String articleTitle) {
        StringBuffer navCode = new StringBuffer();
        navCode.append("当前位置：&nbsp;&nbsp;");
        navCode.append("<a href='" + PropertiesUtil.getValue("host") + "'>主页</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
        navCode.append("<a href='" + PropertiesUtil.getValue("host") + "/arcType/" + typeId + ".html'>" + typeName + "</a>&nbsp;&nbsp;>&nbsp;&nbsp;" + articleTitle);
        return navCode.toString();
    }

    /**
     * 生成帖子列表导航
     * @param typeName
     * @return
     */
    public static String genArticleListNavigation(String typeName){
        StringBuffer navCode=new StringBuffer();
        navCode.append("当前位置：&nbsp;&nbsp;");
        navCode.append("<a href='"+PropertiesUtil.getValue("host")+"'>主页</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
        navCode.append(typeName);
        return navCode.toString();
    }


}
