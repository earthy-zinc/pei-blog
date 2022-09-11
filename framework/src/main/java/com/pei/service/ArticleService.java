package com.pei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pei.entity.Article;
import com.pei.vo.ArticleDetailVo;
import com.pei.vo.HotArticleVo;
import com.pei.vo.PageVo;

import java.util.List;

/**
 * 文章表(Article)表服务接口
 *
 * @author makejava
 * @since 2022-09-06 19:39:06
 */
public interface ArticleService extends IService<Article> {
    List<HotArticleVo> hotArticleList();

    PageVo articleList(Long pageNum, Long pageSize, Long categoryId);

    ArticleDetailVo getArticleDetail(Long id);

    void updateViewCount(Long id);
}

