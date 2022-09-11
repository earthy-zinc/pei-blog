package com.pei.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.pei.common.HttpCodeEnum;
import com.pei.common.R;
import com.pei.security.LoginUser;
import com.pei.utils.JwtUtil;
import com.pei.utils.WebUtils;
import io.jsonwebtoken.Claims;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * 在用户传来请求时，对用户信息进行校验，然后才会进行下一步操作
 * 针对后端中需要进行认证授权的资源，前端需要在其请求头中携带token来证明自己的身份。
 * 这个jwt认证过滤器的作用就是：
 * 1. 从请求头中获取jwt token（如果没有token？可能是在请求不需要认证的资源）
 * 2. 解析token获取用户id（如果没有说明用户没有登录）
 * 3. 查询redis获取用户详细信息
 * 4. 将用户信息存入SecurityContextHolder——一个类似与session的对象。
 * 基于OncePerRequestFilter实现，也就是说每一个请求只会被该过滤器过滤一次
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    @Resource
    private RedisTemplate<String, String> redisTemplate;

    @Override
    protected void doFilterInternal(
            HttpServletRequest httpRequest,
            @NotNull HttpServletResponse httpResponse,
            @NotNull FilterChain filterChain)
            throws ServletException, IOException {
        // 获取token
        String token = httpRequest.getHeader("token");
        if(!StringUtils.hasText(token)) {
            filterChain.doFilter(httpRequest, httpResponse);
            return;
        }

        // 解析token获取用户id，对于获取不到的情况会向前端返回出错信息
        Claims claims = null;
        try {
            claims = JwtUtil.parseJWT(token);
        } catch (Exception e) {
            e.printStackTrace();
            R result = R.errorResult(HttpCodeEnum.NEED_LOGIN);
            WebUtils.renderString(httpResponse, JSON.toJSONString(result));
            return;
        }
        String userId = claims.getSubject();

        // 查询redis获取详细用户信息，获取的信息是spring security使用的UserDetails对象
        LoginUser loginUser = JSONObject.parseObject(
                redisTemplate.opsForValue().get("blogLogin:" + userId), LoginUser.class);
        if(Objects.isNull(loginUser)){
            R result = R.errorResult(HttpCodeEnum.NEED_LOGIN);
            WebUtils.renderString(httpResponse, JSON.toJSONString(result));
            return;
        }

        // 将UserDetails对象包装进spring security使用的认证token中，然后将该认证token存入SecurityContextHolder
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                loginUser, null, null
        );
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        // 对此次请求放行
        filterChain.doFilter(httpRequest,httpResponse);
    }
}
