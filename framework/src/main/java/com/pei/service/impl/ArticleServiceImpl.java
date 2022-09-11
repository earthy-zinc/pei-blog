package com.pei.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pei.dao.ArticleDao;
import com.pei.entity.Article;
import com.pei.entity.Category;
import com.pei.service.ArticleService;
import com.pei.service.CategoryService;
import com.pei.utils.BeanCopy;
import com.pei.vo.ArticleDetailVo;
import com.pei.vo.ArticleVo;
import com.pei.vo.HotArticleVo;
import com.pei.vo.PageVo;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 文章表(Article)表服务实现类
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
@Service("articleService")
public class ArticleServiceImpl extends ServiceImpl<ArticleDao, Article> implements ArticleService {
    @Resource
    private CategoryService categoryService;
    @Resource
    private RedisTemplate<String, Map<String, Long>> redisTemplate;

    /**
     * 查询热门文章
     * 1. 必须是正式文章
     * 2. 按照浏览量进行排序
     * 3. 只查询前十条
     * @return 精简过数据后的 Vo 对象
     */
    @Override
    public List<HotArticleVo> hotArticleList() {
        LambdaQueryWrapper<Article> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Article::getStatus, 0);
        queryWrapper.orderByDesc(Article::getViewCount);
        Page<Article> pageInfo = new Page<>(1, 10);
        this.page(pageInfo, queryWrapper);

        List<Article> articles = pageInfo.getRecords();

        return BeanCopy.copyBeanList(articles, HotArticleVo.class);
    }

    /**
     * 分页查询文章
     * 1. 必须是正式发布的文章
     * 2. 对isTop降序排列
     * 3. 整合分类名称
     * 4. 精简查询结果
     */
    @Override
    public PageVo articleList(Long pageNum, Long pageSize, Long categoryId) {
        // 筛选符合条件的文章
        LambdaQueryWrapper<Article> articleWrapper = new LambdaQueryWrapper<>();
        articleWrapper.eq(Objects.nonNull(categoryId) && categoryId > 0,
                Article::getCategoryId, categoryId);
        articleWrapper.eq(Article::getStatus, 0);
        articleWrapper.orderByDesc(Article::getIsTop);

        // 查询数据库获取文章
        Page<Article> pageInfo = new Page<>(pageNum, pageSize);
        this.page(pageInfo, articleWrapper);

        // 封装到vo对象，精简查询结果
        List<ArticleVo> articleVos = BeanCopy.copyBeanList(pageInfo.getRecords(), ArticleVo.class);

        List<ArticleVo> articleVoList = articleVos.stream().peek(articleVo -> {
            Category category = categoryService.getById(articleVo.getCategoryId());
            String categoryName = category.getName();
            articleVo.setCategoryName(categoryName);
        }).collect(Collectors.toList());

        // 查询分类名称，植入vo对象中
        return new PageVo(articleVoList, pageInfo.getTotal());
    }

    @Override
    public ArticleDetailVo getArticleDetail(Long id) {
        Article article = getById(id);
        ArticleDetailVo articleDetailVo = BeanCopy.copyBean(article, ArticleDetailVo.class);

        // 数据库中目前存放的文章浏览量不够准确，需要从redis中获取
        /* 为什么返回的不是Long类型？
         * 注意踩坑，我们往redis中存放的访问量这个变量的数据类型为Long
         * 但是redis在返回数据却是Integer类型
         * 实际在redis存的是具体的数字，那么当读取的时候，代码并不知道缓存中的数字到底是Integer类型还是Long类型
         * 于是乎会使用实际数字的值进行自动转换——也就是说返回Integer类型，而强转会报异常因此我们先用Number来承接返回值
         * 随后使用.longValue()方法转换成Long类型。
         */
        Number viewCount = (Number) redisTemplate.opsForHash().get("article:viewCount", id.toString());
        assert viewCount != null;
        articleDetailVo.setViewCount(viewCount.longValue());

        // 从数据库获取文章分类名称
        Long categoryId = articleDetailVo.getCategoryId();
        Category category = categoryService.getById(categoryId);
        if(category != null){
            articleDetailVo.setCategoryName(category.getName());
        }
        return articleDetailVo;
    }

    @Override
    public void updateViewCount(Long id) {
        redisTemplate.boundHashOps("article:viewCount").increment(id.toString(), 1);
    }
}

