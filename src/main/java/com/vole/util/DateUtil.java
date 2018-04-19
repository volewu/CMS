package com.vole.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 编写者： vole
 * Time： 2018/4/19.16:53
 * 内容： 时间转换工具
 */
public class DateUtil {

    /**
     * 日期对象转字符串
     * @param date
     * @param format
     * @return
     */
    public static String formatDate(Date date, String format){
        String result="";
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        if(date!=null){
            result=sdf.format(date);
        }
        return result;
    }

    /**
     * 字符串转日期对象
     * @param str
     * @param format
     * @return
     * @throws Exception
     */
    public static Date formatString(String str,String format) throws Exception{
        if(StringUtil.isEmpty(str)){
            return null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        return sdf.parse(str);
    }

    public static String getCurrentDateStr()throws Exception{
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
        return sdf.format(date);
    }
}
