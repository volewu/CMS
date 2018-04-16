package com.vole.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * 编写者： vole
 * Time： 2018/4/13.14:12
 * 内容： ajax 返回输出流工具类
 */
public class ResponseUtil {

    public static void write(HttpServletResponse response, Object o) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(o.toString());
        out.flush();
        out.close();
    }
}
