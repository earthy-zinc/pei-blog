package com.pei.controller;


import com.pei.service.ArticleTagService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 文章标签关联表(ArticleTag)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:43:19
 */
@RestController
@RequestMapping("/articleTag")
public class ArticleTagController{
    /**
     * 服务对象
     */
    @Resource
    private ArticleTagService articleTagService;

}

