package com.heeexy.example.dao;

import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * @author: hxy
 * @description: 作者Dao层
 * @date: 2017/10/24 16:06
 */
public interface WriterDao {
    /**
     * 新增作者
     *
     * @param jsonObject
     * @return
     */
    int addWriter(JSONObject jsonObject);

    /**
     * 统计作者总数
     *
     * @param jsonObject
     * @return
     */
    int countWriter(JSONObject jsonObject);

    /**
     * 作者列表
     *
     * @param jsonObject
     * @return
     */
    List<JSONObject> listWriter(JSONObject jsonObject);

    /**
     * 更新作者
     *
     * @param jsonObject
     * @return
     */
    int updateWriter(JSONObject jsonObject);

    /**
     * 根据发布ID查询信息
     *
     * @param writerId
     * @return JSONObject
     */
    JSONObject getWriterById(String writerId);
}
