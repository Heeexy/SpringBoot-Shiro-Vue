package com.heeexy.example.dao;

import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * @author: hxy
 * @description: 用户/角色/权限
 * @date: 2017-11-14 15:08:45
 */
public interface UserDao {
    /**
     * 查询用户数量
     *
     * @param jsonObject
     * @return
     */
    int countUser(JSONObject jsonObject);

    /**
     * 查询用户列表
     *
     * @param jsonObject
     * @return
     */
    List<JSONObject> listUser(JSONObject jsonObject);

    /**
     * 查询所有的角色
     * 在添加/修改用户的时候要使用此方法
     *
     * @return
     */
    List<JSONObject> getAllRoles();

    /**
     * 新增用户
     *
     * @param jsonObject
     * @return
     */
    int addUser(JSONObject jsonObject);

    /**
     * 修改用户
     *
     * @param jsonObject
     * @return
     */
    int updateUser(JSONObject jsonObject);
}
