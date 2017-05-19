package com.lhd.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.lhd.dto.ArticleDto;
import com.lhd.dto.Message;
import com.lhd.entity.Article;
import com.lhd.entity.ArticleTag;
import com.lhd.entity.Classify;
import com.lhd.entity.Tag;
import com.lhd.service.Impl.ArticleServiceImpl;
import com.lhd.service.Impl.ClassifyServiceImpl;
import com.lhd.service.Impl.TagServiceImpl;
import com.lhd.utils.PageUtils;
import com.lhd.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.util.*;


/**
 * Created by lhd on 2017/5/13.
 * 文章controller
 */

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private ClassifyServiceImpl classifyService;

    @Autowired
    private TagServiceImpl tagService;

    /**
     * 文章列表显示
     *
     * @param model
     * @param pageNo
     * @return
     */
    @RequestMapping(value = "/article-list", method = RequestMethod.GET)
    public String articleList(Model model, String pageNo) {
        int currentNo = 1;
        if (pageNo != null) currentNo = Integer.parseInt(pageNo);
        Page<ArticleDto> page = new Page<ArticleDto>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", (currentNo - 1) * 5);
        map.put("pageSize", 5);
        List<ArticleDto> articleDtos = articleService.selectArticleList(map);
        page.setRecords(articleDtos);
        page.getCondition().put("pagination", getPage(currentNo));
        model.addAttribute("page", page);
        return "article/articleList";
    }

    /**
     * 分页数据获取
     *
     * @param currentPageNo
     * @return
     */
    private String getPage(int currentPageNo) {
        Wrapper wrapper = new EntityWrapper();
        int count = articleService.selectCount(wrapper);
        String pagination = PageUtils.getPagination(
                currentPageNo, "/article/article-list", "", ((count - 1) / 5) + 1);
        return pagination;
    }

    /**
     * 文章添加
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/article-add")
    public String articleAdd(Model model) {
        List<Classify> classifies = classifyService.selectList(new EntityWrapper<Classify>());
        model.addAttribute("classifies", classifies);
        return "article/articleAdd";
    }

    /**
     * 插入文章
     *
     * @param article
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/article-insert", method = RequestMethod.POST)
    public String articleInsert(Article article) throws IOException {
        article.setContent(setMarkdown(article.getContent()));
        article.setId(StringUtils.getUUId());
        articleTag(article.getId(), article.getTagId());
        article.setClick(0);
        article.setCreateTime(new Date());
        article.setUpdateTime(new Date());
        article.setCreateBy("admin");
        article.setUpdateBy("admin");
        articleService.insert(article);
        return "redirect:/article/article-list";
    }

    /**
     * 解析传送过来的tagChain
     *
     * @param articleId
     * @param tagChain
     */
    private void articleTag(String articleId, String tagChain) {
        String[] tagName = tagChain.split("[ ]");
        for (String tagN : tagName) {
            Tag tag = tagService.selectTagByTagName(tagN);
            if (tag == null) {
                tag = new Tag();
                tag.setId(StringUtils.getUUId());
                tag.setTagName(tagN);
                tagService.insert(tag);
            }
            Map<String,String> paramMap = new HashMap<String, String>();
            paramMap.put("articleId",articleId);
            paramMap.put("tagId",tag.getId());
            ArticleTag exist = tagService.selectArticleTagExist(paramMap);
            if(exist == null) {
                ArticleTag articleTag = new ArticleTag();
                articleTag.setId(StringUtils.getUUId());
                articleTag.setTagId(tag.getId());
                articleTag.setArticleId(articleId);
                tagService.insertArticleTag(articleTag);
            }
        }
    }

    /**
     * 删除文章
     *
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/article-delete/{articleId}")
    @ResponseBody
    public Message articleDelete(@PathVariable("articleId") String articleId) {
        Message message = new Message();
        boolean b = articleService.deleteById(articleId);
        articleService.deleteArticleTagByArticleId(articleId);
        if (b == true) {
            message.setMessage("删除成功");
            message.setStatus(true);
        } else {
            message.setMessage("删除失败");
            message.setStatus(false);
        }
        return message;
    }


    /**
     * 查看文章详情
     *
     * @param model
     * @param articleId
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/article-detail/{articleId}", method = RequestMethod.GET)
    public String articleDetail(Model model, @PathVariable("articleId") String articleId) throws IOException {
        ArticleDto article = articleService.selectArticleDto(articleId);
        article.setContent(getMarkdown(article.getContent()));
        List<String> tagIdList = tagService.selectTagIdByArticleId(articleId);
        article.setTagChain(getTagChain(tagIdList));
        List<Classify> classifies = classifyService.selectList(new EntityWrapper<Classify>());
        article.setContent(article.getContent().trim());
        model.addAttribute("classifies", classifies);
        model.addAttribute("article", article);
        return "article/articleDetail";
    }

    /**
     * 获取标签链
     *
     * @param tagIdList
     * @return
     */
    private String getTagChain(List<String> tagIdList) {
        String tagChain = "";
        for (String tagId : tagIdList) {
            Tag tag = tagService.selectById(tagId);
            if (tag != null && tag.getTagName() != null)
                tagChain += " " + tag.getTagName();
        }
        return tagChain.trim();
    }

    /**
     * 文章更新
     *
     * @param article
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/article-update")
    public String articleUpdate(Article article) throws IOException {
        Article oldArticle = articleService.selectById(article.getId());
        updateMarkdown(article.getContent(), oldArticle.getContent());
        article.setContent(oldArticle.getContent());
        articleTag(article.getId(), article.getTagId());
        article.setUpdateBy("admin");
        article.setUpdateTime(new Date());
        articleService.updateArticle(article);
        return "redirect:/article/article-list";
    }

    /**
     * 更新markdown文件
     *
     * @param content
     * @return
     * @throws IOException
     */
    private String updateMarkdown(String content, String rootPath) throws IOException {
        File mdFile = new File(rootPath);
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(mdFile),"utf-8"));
        bw.write(content);
        bw.flush();
        bw.close();
        return mdFile.toString();
    }

    /**
     * 将markdown信息存入文件中
     *
     * @param content
     * @return
     * @throws IOException
     */
    private String setMarkdown(String content) throws IOException {
        Calendar calendar = Calendar.getInstance();
        String rootPath = "f:/blog/upload/" + calendar.get(Calendar.YEAR) + "/" +
                (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH);
        File file = new File(rootPath);
        if (!file.exists()) file.mkdirs();
        File mdFile = new File(file + File.separator + System.currentTimeMillis() + ".md");
        BufferedWriter bw = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(mdFile),"utf-8"));
        /*PrintWriter pw = new PrintWriter(new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(file),"gbk")));*/
        bw.write(content);
        bw.flush();
        bw.close();
        return mdFile.toString();
    }

    /**
     * 获取markdown文件信息
     *
     * @param rootPath
     * @return
     * @throws IOException
     */
    private String getMarkdown(String rootPath) throws IOException {
        File file = new File(rootPath);
        BufferedReader br = new BufferedReader(new InputStreamReader(
                new FileInputStream(file),"utf-8"));
        StringBuffer suf = new StringBuffer();
        String content;
        while ((content = br.readLine()) != null) {
            suf.append(content);
            suf.append("\n");
        }
        br.close();
        return suf.toString();
    }

    public static void main(String[] args) throws IOException {
        ArticleController articleController = new ArticleController();
        //articleController.setMarkdown("11\n中文");
        System.out.println(articleController.getMarkdown("f:/blog/md/2017/5/19/1495163187775.md"));
    }


}
