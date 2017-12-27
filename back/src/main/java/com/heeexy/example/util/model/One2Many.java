package com.heeexy.example.util.model;

import com.alibaba.fastjson.JSONObject;

import java.util.List;
import java.util.Set;

/**
 * @author: hxy
 * @description: MyBatis的一对多JSON返回对象
 * <p>
 * 处理嵌套查询结果时，MyBatis会根据bean定义的属性类型来初始化嵌套的成员变量，
 * 主要看其是不是Collection
 * 如果这里不定义，那么嵌套返回结果里就只能返回一对一的结果，而不是一对多的
 * <p>
 * 对MyBatis源码有研究的同学看DefaultResultSetHandler.instantiateCollectionPropertyIfAppropriate()就明白了
 * @date: 2017/10/24 10:17
 */
public class One2Many extends JSONObject {
    private Set<String> roleList;
    private Set<String> menuList;
    private Set<String> permissionList;
    private Set<Integer> permissionIds;
    private List<JSONObject> picList;
    private List<JSONObject> menus;
    private List<JSONObject> users;
    private List<JSONObject> permissions;
}
