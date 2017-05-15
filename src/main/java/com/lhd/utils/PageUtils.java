package com.lhd.utils;

/**
 * Created by lhd on 2017/5/14.
 */
public class PageUtils {

    private static int pageMaxSize;

    /**
     * 获取分页html
     * @param currentPageNo 当前页面
     * @param action 执行action
     * @param parameters 参数
     * @param maxPageNo 最大页数
     * @return
     */
    public static String getPagination(int currentPageNo,String action,String parameters,int maxPageNo){
        int begainNo = currentPageNo - 5 > 0 ? currentPageNo - 5 : 1;
        int endNo = begainNo + 9 > maxPageNo ? maxPageNo : begainNo + 9;
        StringBuffer sb = new StringBuffer();
        if (maxPageNo > 1) {
            sb.append("<ul class=\"pagination\">");
            sb.append(currentPageNo > 1 ? ("<li><a href = \"" + action + "?pageNo=" +
                    (currentPageNo - 1 > 1 ? currentPageNo - 1 : 1)  + parameters +
                    "\">上一页</a></li>") : "<li class=\"disabled\"><a>上一页</a></li>");
            for (int i = begainNo; i <= endNo; i++) {
                if(currentPageNo == i) {
                    sb.append("<li class=\"active\"><a href=\""+ action+"?pageNo="+i+"\">"+i+"</a></li>");
                }else{
                    sb.append("<li><a href=\""+ action+"?pageNo="+i +"\">"+i+"</a></li>");
                }
            }
            sb.append(currentPageNo < maxPageNo ? ("<li><a href = \"" + action + "?pageNo=" +
                    (currentPageNo + 1 > maxPageNo ? maxPageNo : currentPageNo + 1) +
                    parameters + "\">下一页</a></li>") : "<li class=\"disabled\"><a>下一页</a></li>");
            sb.append("</ul>");
        }


        return sb.toString();
    }

    public static void main(String[] args) {

        System.out.println(getPagination(2,"find","",2));
    }

}
