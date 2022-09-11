package com.pei.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 角色和菜单关联表(RoleMenu)表控制层
 *
 * @author makejava
 * @since 2022-09-06 19:41:59
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_role_menu")
public class RoleMenu{
    //角色ID
    private Long roleId;
    //菜单ID
    private Long menuId;
}

