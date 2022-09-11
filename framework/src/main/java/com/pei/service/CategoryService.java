package com.pei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pei.entity.Category;
import com.pei.vo.CategoryVo;

import java.util.List;

/**
 * 分类表(Category)表服务接口
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
public interface CategoryService extends IService<Category> {
    List<CategoryVo> getCategoryList();
}

