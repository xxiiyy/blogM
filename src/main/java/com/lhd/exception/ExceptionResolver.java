package com.lhd.exception;

/**
 * Created by lhd on 2017/5/15.
 */


import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lhd on 2017/5/4.
 * 全局异常处理器
 */
public class ExceptionResolver implements HandlerExceptionResolver {

    public ModelAndView resolveException(HttpServletRequest request
            , HttpServletResponse response, Object o, Exception e) {
        String message = null;
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/page-404.html");
        /*if(e instanceof UserException){
            message = ((UserException)e).getMessage();
            mav.setViewName("/error.jsp");
            mav.addObject("errorMsg",message);
        }else{
            message = "未知错误";
            mav.setViewName("/error.jsp");
            mav.addObject("errorMsg",message);
        }*/
        return mav;
    }
}

