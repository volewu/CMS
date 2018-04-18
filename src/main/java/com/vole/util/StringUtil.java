package com.vole.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 编写者： vole
 * Time： 2018/4/18.10:29
 * 内容：字符串工具类
 */
public class StringUtil {

    /**
     * 判断是否是空
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || "".equals(str);
    }

    /**
     * 判断是否不是空
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        return str != null && !"".equals(str);
    }

    /**
     * 过滤掉集合中的空格元素
     *
     * @param list
     * @return
     */
    public static List<String> filterWhite(List<String> list) {
        List<String> resultList = new ArrayList<String>();
        for (String l : list) {
            if (isNotEmpty(l))
                resultList.add(l);
        }
        return resultList;
    }
}
