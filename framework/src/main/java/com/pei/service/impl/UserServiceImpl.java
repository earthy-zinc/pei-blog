package com.pei.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pei.dao.UserDao;
import com.pei.entity.User;
import com.pei.service.UserService;
import com.pei.utils.BeanCopy;
import com.pei.utils.SecurityUtils;
import com.pei.vo.UserInfoVo;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户表(User)表服务实现类
 *
 * @author makejava
 * @since 2022-09-06 19:41:59
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
    @Resource
    private PasswordEncoder passwordEncoder;

    @Override
    public UserInfoVo userInfo() {
        User user = getById(SecurityUtils.getUserId());
        return BeanCopy.copyBean(user, UserInfoVo.class);
    }

    @Override
    public User register(User user) {
        // TODO 对数据进行校验
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        save(user);
        return user;
    }

}

