package com.pei.controller;


import com.pei.common.R;
import com.pei.service.ArticleService;
import com.pei.vo.ArticleDetailVo;
import com.pei.vo.HotArticleVo;
import com.pei.vo.PageVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 文章表(Article)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:42:48
 */
@RestController
@RequestMapping("/article")
public class ArticleController{
    /**
     * 服务对象
     */
    @Resource
    private ArticleService articleService;

    @GetMapping("/articleList")
    public R list(Long pageNum, Long pageSize, Long categoryId){
        PageVo pageVo = articleService.articleList(pageNum, pageSize, categoryId);
        return R.okResult(pageVo);
    }

    @GetMapping("/hotArticleList")
    public R hotArticleList(){
        List<HotArticleVo> hotArticleVos = articleService.hotArticleList();
        return R.okResult(hotArticleVos);
    }

    @GetMapping("/{id}")
    public R getArticleDetail(@PathVariable("id") Long id){
        ArticleDetailVo articleDetail = articleService.getArticleDetail(id);
        return R.okResult(articleDetail);
    }

    @PutMapping("/updateViewCount/{id}")
    public R updateViewCount(@PathVariable("id") Long id){
        articleService.updateViewCount(id);
        return R.okResult();
    }
}

