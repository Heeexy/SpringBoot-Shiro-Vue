package com.heeexy.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.service.WriterService;
import com.heeexy.example.util.CommonUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: hxy
 * @description: 作者相关Controller
 * @date: 2017/10/24 16:04
 */
@RestController
@RequestMapping("/writer")
public class WriterController {

    @Autowired
    private WriterService writerService;

    /**
     * 查询作者列表
     *
     * @param request
     * @return
     */
    @RequiresPermissions("writer:list")
    @GetMapping("/listWriter")
    public JSONObject listWriter(HttpServletRequest request) {
        return writerService.listWriter(CommonUtil.request2Json(request));
    }

    /**
     * 新增作者
     *
     * @param requestJson
     * @return
     */
    @RequiresPermissions("writer:add")
    @PostMapping("/addWriter")
    public JSONObject addWriter(@RequestBody JSONObject requestJson) {
        CommonUtil.hasAllRequired(requestJson, "writerName");
        return writerService.addWriter(requestJson);
    }

    /**
     * 修改作者
     *
     * @param requestJson
     * @return
     */
    @RequiresPermissions("writer:update")
    @PostMapping("/updateWriter")
    public JSONObject updateWriter(@RequestBody JSONObject requestJson) {
        CommonUtil.hasAllRequired(requestJson, "writerId,writerName");
        return writerService.updateWriter(requestJson);
    }

    /**
     * 根据发布ID查询信息
     *
     * @param writerId
     * @return JSONObject
     */
    @GetMapping("/getWriterById")
    public JSONObject getWriterById(String writerId) {
        return writerService.getWriterById(writerId);
    }
}
