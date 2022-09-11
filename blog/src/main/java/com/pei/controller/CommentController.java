package com.pei.controller;

import com.pei.common.R;
import com.pei.entity.Comment;
import com.pei.service.CommentService;
import com.pei.utils.SecurityUtils;
import com.pei.vo.PageVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private CommentService commentService;

    @GetMapping("/commentList")
    public R commentList(Long articleId, Long pageNum, Long pageSize){
        PageVo pageVo = commentService.listWithTree(articleId, pageNum, pageSize);
        return R.okResult(pageVo);
    }

    @PostMapping
    public R addComment(@RequestBody Comment comment){
        comment.setCreateBy(SecurityUtils.getUserId());
        commentService.save(comment);
        return R.okResult();
    }
}
