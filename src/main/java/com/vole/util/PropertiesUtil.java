package com.vole.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 编写者： vole
 * Time： 2018/4/18.10:38
 * 内容：properties 配置文件工具类
 */
public class PropertiesUtil {


    /**
     * 根据key获取value
     * @param key
     * @return
     */
    public static String getValue(String key){
        Properties properties = new Properties();
        InputStream in = new PropertiesUtil().getClass().getResourceAsStream("/cms.properties");
        try {
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties.getProperty(key);
    }
}
