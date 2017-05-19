package com.lhd.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
/**
 * Created by lhd on 2017/5/14.
 * markdown上传文件,这是设置上传路径
 */
@Controller
public class UploadController {

    @RequestMapping(value="/uploadfile",method=RequestMethod.POST)
    public void uploadfile(HttpServletRequest request,HttpServletResponse response,
                           @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
//            Calendar calendar = Calendar.getInstance();
            /*String rootPath = "c:\\blog\\upload\\";
            String rootPath = "c:/blog/upload/" + calendar.get(Calendar.YEAR) + "/" +
                    (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH);*/
            System.out.println(rootPath);

            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath=new File(rootPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }

            //最终文件名
            File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

            //下面response返回的json格式是editor.md所限制的，规范输出就OK
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/resources/upload/" + attach.getOriginalFilename() + "\"}" );
//            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\""+rootPath+"/"+attach.getOriginalFilename()+"\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        String x = "aa";
        String a = "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/resources/upload/" + x + "\"}";
        System.out.println(a);
        String path = "c://a/";

        String b = "{\"success\": 1, \"message\":\"上传成功\",\"url\":\""+path + "" +x+ "" + "\"}";
        System.out.println(b);
    }
}