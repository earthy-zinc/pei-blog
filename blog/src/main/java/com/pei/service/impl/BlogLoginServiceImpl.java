package com.pei.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.pei.entity.User;
import com.pei.exception.CustomException;
import com.pei.security.LoginUser;
import com.pei.service.BlogLoginService;
import com.pei.utils.BeanCopy;
import com.pei.utils.JwtUtil;
import com.pei.vo.BlogUserLoginVo;
import com.pei.vo.UserInfoVo;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Objects;

@Service
public class BlogLoginServiceImpl implements BlogLoginService {
    @Resource
    private AuthenticationManager authenticationManager;
    @Resource
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 博客系统认证登录的逻辑实现
     * 1. 创建一个用于spring security认证的token传入用户名密码
     * 2. 调用authenticationManager的认证方法进行认证
     * 3. 如果没有认证信息，说明不是本系统的用户，返回用户名密码错误
     * 4. 如果是本系统成员，我们可以从认证信息中获取用户信息
     *    这里来的用户信息类型是spring security提供的UserDetails接口，我们在项目中需要实现它。
     * 5. 从UserDetails中获取我们自己的数据库实体对象，获取用户id生成jwt token
     *    jwt token将连带着部分用户信息返回给前端
     * 6. 把用户信息存放到redis中，下次认证授权会先根据前端传来的jwt token查询redis中是否有信息
     *    如果没有说明用户要么没登陆，要么不是本系统用户
     *
     * @param user 前端传来的用户名和密码，封装为数据库的user对象
     * @return 返回给前端的用户信息和token
     */
    @Override
    public BlogUserLoginVo login(User user) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
                user.getUserName(), user.getPassword());
        Authentication authenticate = authenticationManager.authenticate(token);

        if(Objects.isNull(authenticate)){
            throw new CustomException("用户名密码错误");
        }
        LoginUser loginUser = (LoginUser) authenticate.getPrincipal();
        String userId = loginUser.getUser().getId().toString();
        String jwt = JwtUtil.createJWT(userId);

        redisTemplate.opsForValue().set("blogLogin:"+userId, JSONObject.toJSONString(loginUser));
        UserInfoVo userInfoVo = BeanCopy.copyBean(loginUser.getUser(), UserInfoVo.class);
        return new BlogUserLoginVo(jwt, userInfoVo);
    }

    /**
     * 用户下线功能，首先从SecurityContextHolder获取对应用户的认证授权信息
     * 然后获取到用户信息——用户id，根据用户id找到redis中对应值删除
     */
    @Override
    public void logout() {
        UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken)
                SecurityContextHolder.getContext().getAuthentication();
        LoginUser loginUser = (LoginUser) authenticationToken.getPrincipal();
        redisTemplate.delete("blogLogin:"+loginUser.getUser().getId());
    }
}
