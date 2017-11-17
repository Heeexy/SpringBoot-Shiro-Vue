package com.heeexy.example.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.config.exception.CommonJsonException;
import com.heeexy.example.dao.WriterDao;
import com.heeexy.example.service.WriterService;
import com.heeexy.example.util.CommonUtil;
import com.heeexy.example.util.RandomUtil;
import com.heeexy.example.util.constants.ErrorEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

/**
 * @author: hxy
 * @description:
 * @date: 2017/10/24 16:07
 */
@Service
public class WriterServiceImpl implements WriterService {

    @Autowired
    private WriterDao writerDao;

    /**
     * 新增作者
     *
     * @param jsonObject
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public JSONObject addWriter(JSONObject jsonObject) {
        String writerId = RandomUtil.genarateId("");
        jsonObject.put("writerId", writerId);
        writerDao.addWriter(jsonObject);
        return CommonUtil.successJson();
    }

    /**
     * 作者列表
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject listWriter(JSONObject jsonObject) {
        CommonUtil.fillPageParam(jsonObject);
        int count = writerDao.countWriter(jsonObject);
        List<JSONObject> list = writerDao.listWriter(jsonObject);
        return CommonUtil.successPage(jsonObject, list, count);
    }

    /**
     * 更新作者
     *
     * @param jsonObject
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public JSONObject updateWriter(JSONObject jsonObject) {
        int i = writerDao.updateWriter(jsonObject);
        if (i == 1) {
            return CommonUtil.successJson();
        } else {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            throw new CommonJsonException(ErrorEnum.E_602);
        }
    }

    /**
     * 根据发布ID查询信息
     *
     * @param writerId
     * @return JSONObject
     */
    @Override
    public JSONObject getWriterById(String writerId) {
        JSONObject jsonObject = writerDao.getWriterById(writerId);
        return CommonUtil.successJson(jsonObject);
    }
}
