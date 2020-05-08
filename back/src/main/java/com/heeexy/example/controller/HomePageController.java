package com.heeexy.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 设置首页
 */
@Controller
public class HomePageController {
    @RequestMapping
    public String index() {
        return "forward:index.html";
    }
}