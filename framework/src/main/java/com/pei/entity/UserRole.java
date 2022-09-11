package com.pei.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户和角色关联表(UserRole)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:41:59
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_user_role")
public class UserRole{
    //用户ID
    private Long userId;
    //角色ID
    private Long roleId;
}

