package com.heeexy.example.config.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.MDC;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * @author heeexy
 * @description: 打印每个请求的入参、出参等信息
 */
@Aspect
@Component
@Slf4j
@Order(1)
public class WebLogAspect {
    @Pointcut("execution(public * com.heeexy.example.controller..*.*(..))")
    public void webLog() {
    }

    @Pointcut(" execution(public * com.heeexy.example.config.exception.GlobalExceptionHandler.*(..))")
    public void exceptions() {
    }

    /**
     * 只在进入controller时记录请求信息
     */
    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        log.debug("请求路径 {} ,进入方法 {}", request.getRequestURI(), joinPoint.getSignature().getDeclaringTypeName() + ":" + joinPoint.getSignature().getName());
        MDC.put("req", getRequestInfo(request).toJSONString());
        MDC.put("startTime", String.valueOf(System.currentTimeMillis()));
    }

    /**
     * 打印请求日志
     */
    @AfterReturning(pointcut = "webLog()|| exceptions()", returning = "result")
    public void afterReturning(Object result) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        Map<String, String> map = MDC.getCopyOfContextMap();
        if (map != null) {
            JSONObject jsonObject = new JSONObject(true);
            jsonObject.put("uri", request.getRequestURI());
            jsonObject.put("took", System.currentTimeMillis() - Long.parseLong(map.getOrDefault("startTime", String.valueOf(System.currentTimeMillis()))));
            jsonObject.put("userId", map.getOrDefault("userId", ""));
            jsonObject.put("req", JSON.parseObject(map.getOrDefault("req", "")));
            if (result != null) {
                jsonObject.put("res", JSON.parseObject(result.toString()));
            }
            log.info(jsonObject.toJSONString());
        }
    }

    /**
     * 读取请求信息,转换为json
     */
    private JSONObject getRequestInfo(HttpServletRequest req) {
        JSONObject requestInfo = new JSONObject();
        try {
            StringBuffer requestURL = req.getRequestURL();
            requestInfo.put("requestURL", requestURL);
            String method = req.getMethod();
            requestInfo.put("method", method);
            if (req.getQueryString() != null) {
                requestInfo.put("queryString", URLDecoder.decode(req.getQueryString(), "UTF-8"));
            }
            String remoteAddr = req.getRemoteAddr();
            requestInfo.put("remoteAddr", remoteAddr);
            if (req instanceof ContentCachingRequestWrapper) {
                ContentCachingRequestWrapper wrapper = (ContentCachingRequestWrapper) req;
                String bodyStr = new String(wrapper.getContentAsByteArray(), StandardCharsets.UTF_8);
                if (bodyStr.startsWith("{")) {
                    JSONObject jsonObject = JSON.parseObject(bodyStr);
                    requestInfo.put("requestBody", jsonObject);
                }
            }
        } catch (Exception e) {
            log.error("解析请求失败", e);
            requestInfo.put("parseError", e.getMessage());
        }
        return requestInfo;
    }
}
