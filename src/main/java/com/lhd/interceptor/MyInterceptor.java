package com.lhd.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lhd on 2017/5/16.
 */
public class MyInterceptor implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.err.println("page-404 pre");
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.err.println("page-404 post"+httpServletResponse.getStatus());
        if("404".equals(httpServletResponse.getStatus())){
            System.err.println("page-404");
            modelAndView.setViewName("/page-404.html");
        }else if("500".equals(httpServletResponse.getStatus())){
            modelAndView.setViewName("/page-500.html");
        }
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.err.println("page-404 aft");
    }
}
