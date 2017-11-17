package com.heeexy.example.service;

import com.alibaba.fastjson.JSONObject;

/**
 * @author: hxy
 * @description: 用户/角色/权限
 * @date: 2017/11/2 10:18
 */
public interface UserService {
    /**
     * 用户列表
     *
     * @param jsonObject
     * @return
     */
    JSONObject listUser(JSONObject jsonObject);

    /**
     * 查询所有的角色
     * 在添加/修改用户的时候要使用此方法
     *
     * @return
     */
    JSONObject getAllRoles();

    /**
     * 添加用户
     *
     * @param jsonObject
     * @return
     */
    JSONObject addUser(JSONObject jsonObject);

    /**
     * 修改用户
     *
     * @param jsonObject
     * @return
     */
    JSONObject updateUser(JSONObject jsonObject);

    /**
     * 角色列表
     *
     * @param jsonObject
     * @return
     */
    JSONObject listRole(JSONObject jsonObject);

    /**
     * 添加角色
     *
     * @param jsonObject
     * @return
     */
    JSONObject addRole(JSONObject jsonObject);

    /**
     * 修改角色
     *
     * @param jsonObject
     * @return
     */
    JSONObject updateRole(JSONObject jsonObject);
}
