package com.pei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pei.entity.User;
import com.pei.vo.UserInfoVo;

/**
 * 用户表(User)表服务接口
 *
 * @author makejava
 * @since 2022-09-06 19:41:59
 */
public interface UserService extends IService<User> {

    UserInfoVo userInfo();

    User register(User user);
}

