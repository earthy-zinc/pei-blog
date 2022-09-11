package com.pei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pei.entity.Comment;
import com.pei.vo.PageVo;

/**
 * 评论表(Comment)表服务接口
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
public interface CommentService extends IService<Comment> {

    PageVo listWithTree(Long articleId, Long pageNum, Long pageSize);
}

