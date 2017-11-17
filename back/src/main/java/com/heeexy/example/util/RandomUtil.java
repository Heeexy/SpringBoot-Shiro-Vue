package com.heeexy.example.util;

import java.util.UUID;

/**
 * @author: hxy
 * @description: 生成随机码的工具类
 * @date: 2017/10/26 14:20
 */
public class RandomUtil {
    /**
     * 生成前缀+32位编码 用作id
     *
     * @return string
     */
    public static String genarateId(String prefix) {
        String uuid = prefix + UUID.randomUUID().toString().trim().replaceAll("-", "");
        return uuid;
    }
}
