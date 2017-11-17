package com.heeexy.example.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.UserDao;
import com.heeexy.example.service.UserService;
import com.heeexy.example.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: hxy
 * @description: 用户/角色/权限
 * @date: 2017/11/2 10:18
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    /**
     * 装饰公司列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject listUser(JSONObject jsonObject) {
        CommonUtil.fillPageParam(jsonObject);
        int count = userDao.countUser(jsonObject);
        List<JSONObject> list = userDao.listUser(jsonObject);
        return CommonUtil.successPage(jsonObject, list, count);
    }

    /**
     * 添加用户
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject addUser(JSONObject jsonObject) {
        userDao.addUser(jsonObject);
        return CommonUtil.successJson();
    }

    /**
     * 查询所有的角色
     * 在添加/修改用户的时候要使用此方法
     *
     * @return
     */
    @Override
    public JSONObject getAllRoles() {
        List<JSONObject> roles = userDao.getAllRoles();
        return CommonUtil.successPage(roles);
    }

    /**
     * 修改用户
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject updateUser(JSONObject jsonObject) {
        userDao.updateUser(jsonObject);
        return CommonUtil.successJson();
    }

    /**
     * 角色列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject listRole(JSONObject jsonObject) {
        return null;
    }

    /**
     * 添加角色
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject addRole(JSONObject jsonObject) {
        return null;
    }

    /**
     * 修改角色
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject updateRole(JSONObject jsonObject) {
        return null;
    }
}
