package com.vole.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 编写者： vole
 * Time： 2018/4/13.11:41
 * 内容： Md5加密工具类
 */
public class CryptographyUtil {

    public static final String SALT = "gakki";

    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }

    public static void main(String[] args) {
        String password = "123456";
        System.out.println("Md5加密后：" + CryptographyUtil.md5(password, CryptographyUtil.SALT));
    }
}
