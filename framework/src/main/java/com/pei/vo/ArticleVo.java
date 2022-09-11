package com.pei.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleVo {
    private Long categoryId;

    private String categoryName;

    private Date createTime;

    private Long id;

    private Long likeCount;

    private String summary;

    private String thumbnail;

    private String title;

    private Long viewCount;
}
