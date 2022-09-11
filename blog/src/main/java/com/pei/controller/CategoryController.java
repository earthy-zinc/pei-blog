package com.pei.controller;


import com.pei.common.R;
import com.pei.service.CategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 分类表(Category)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:44:13
 */
@RestController
@RequestMapping("/category")
public class CategoryController{
    /**
     * 服务对象
     */
    @Resource
    private CategoryService categoryService;

    @GetMapping("/getCategoryList")
    public R list(){
        return R.okResult(categoryService.getCategoryList());
    }
}

