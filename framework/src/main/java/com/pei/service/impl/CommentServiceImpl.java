package com.pei.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pei.dao.CommentDao;
import com.pei.entity.Comment;
import com.pei.entity.User;
import com.pei.service.CommentService;
import com.pei.service.UserService;
import com.pei.utils.BeanCopy;
import com.pei.vo.CommentVo;
import com.pei.vo.PageVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 评论表(Comment)表服务实现类
 *
 * @author makejava
 * @since 2022-09-06 19:39:07
 */
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentDao, Comment> implements CommentService {
    @Resource
    private UserService userService;

    /**
     * 分页查询评论以及所有评论下的评论
     * 1. 查询根评论，按时间排序
     * 2. 查询每一个评论用户的用户名
     * 3. 整合成列表返回
     * @param articleId 文章id
     * @return 返回查询好的评论分页对象
     */
    @Override
    public PageVo listWithTree(Long articleId, Long pageNum, Long pageSize) {
        LambdaQueryWrapper<Comment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Comment::getArticleId, articleId);
        queryWrapper.eq(Comment::getRootId, -1);
        queryWrapper.orderByDesc(Comment::getCreateTime);

        Page<Comment> pageInfo = new Page<>(pageNum, pageSize);
        page(pageInfo, queryWrapper);

        List<CommentVo> commentVoList = toCommentVoList(pageInfo.getRecords());
        List<CommentVo> commentVos = commentVoList.stream().peek(commentVo -> {
            List<CommentVo> children = getChildren(commentVo.getId());
            commentVo.setChildren(children);
        }).collect(Collectors.toList());

        return new PageVo(commentVos, pageInfo.getTotal());
    }

    /**
     * 根据根评论的id查询所对应的子评论的集合
     * @param id 根评论的id
     */
    private List<CommentVo> getChildren(Long id){

        LambdaQueryWrapper<Comment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Comment::getRootId, id);
        queryWrapper.orderByAsc(Comment::getCreateTime);

        List<Comment> commentList = list(queryWrapper);
        return toCommentVoList(commentList);
    }

    private List<CommentVo> toCommentVoList(List<Comment> list){
        List<CommentVo> commentVos = BeanCopy.copyBeanList(list, CommentVo.class);
        return commentVos.stream().peek(commentVo -> {
            // 通过用户id获取用户名
            Long userId = commentVo.getCreateBy();
            User user = userService.getById(userId);
            if(Objects.nonNull(user.getUserName()))
                commentVo.setUsername(user.getNickName());
            if(Objects.nonNull(user.getAvatar()))
                commentVo.setAvatar(user.getAvatar());

            // 如果有该评论是回复 别人的评论，那么通过自身携带的别人id查询别人的用户名
            if (commentVo.getToCommentId() != -1) {
                User toUser = userService.getById(commentVo.getToCommentUserId());
                if(Objects.nonNull(toUser.getNickName()))
                    commentVo.setToCommentUserName(toUser.getNickName());
                if(Objects.nonNull(user.getAvatar()))
                    commentVo.setAvatar(user.getAvatar());
            }
        }).collect(Collectors.toList());
    }
}

