package com.pei.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pei.dao.CategoryDao;
import com.pei.entity.Article;
import com.pei.entity.Category;
import com.pei.service.ArticleService;
import com.pei.service.CategoryService;
import com.pei.utils.BeanCopy;
import com.pei.vo.CategoryVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 分类表(Category)表服务实现类
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, Category> implements CategoryService {

    @Resource
    private ArticleService articleService;

    /**
     * 查询目前文章的所有分类
     * 由于制定的分类下面 有些可能并没有文章存在，所以我们不能将这些分类展示出来
     * 要求：
     *      1. 只展示有正式发布文章的分类
     *      2. 正常状态的分类
     * 逻辑：
     *      1. 获取所有正式文章，并筛选出分类id，然后对分类id去重
     *      2. 查询分类表，过滤出异常状态的分类。
     *
     * @return 返回文章分类id和名称name的列表
     */
    @Override
    public List<CategoryVo> getCategoryList() {
        // 获取所有已发布的文章
        LambdaQueryWrapper<Article> articleWrapper = new LambdaQueryWrapper<>();
        // 0 表示已发布，1 表示草稿状态
        articleWrapper.eq(Article::getStatus,0);
        List<Article> articles = articleService.list(articleWrapper);

        // 筛选出已发布文章的分类id
        Set<Long> categoryIds = articles.stream()
                .map(Article::getCategoryId)
                .collect(Collectors.toSet());

        // 查询分类表，获取分类信息
        List<Category> categoryList = this.listByIds(categoryIds);
        return BeanCopy.copyBeanList(categoryList, CategoryVo.class);
    }
}

