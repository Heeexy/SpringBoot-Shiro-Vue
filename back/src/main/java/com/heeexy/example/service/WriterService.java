package com.heeexy.example.service;

import com.alibaba.fastjson.JSONObject;

/**
 * @author: hxy
 * @date: 2017/10/24 16:06
 */
public interface WriterService {
    /**
     * 新增作者
     *
     * @param jsonObject
     * @return
     */
    JSONObject addWriter(JSONObject jsonObject);

    /**
     * 作者列表
     *
     * @param jsonObject
     * @return
     */
    JSONObject listWriter(JSONObject jsonObject);

    /**
     * 更新作者
     *
     * @param jsonObject
     * @return
     */
    JSONObject updateWriter(JSONObject jsonObject);

    /**
     * 根据发布ID查询信息
     *
     * @param writerId
     * @return JSONObject
     */
    JSONObject getWriterById(String writerId);
}
