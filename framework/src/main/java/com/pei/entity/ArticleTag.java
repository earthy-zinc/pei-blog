package com.pei.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 文章标签关联表(ArticleTag)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("pei_article_tag")
public class ArticleTag{
    //文章id
    private Long articleId;
    //标签id
    private Long tagId;
}

