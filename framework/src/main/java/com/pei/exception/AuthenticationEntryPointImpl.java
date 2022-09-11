package com.pei.exception;

import com.alibaba.fastjson.JSON;
import com.pei.common.HttpCodeEnum;
import com.pei.common.R;
import com.pei.utils.WebUtils;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthenticationEntryPointImpl
        implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest httpServletRequest,
                         HttpServletResponse httpServletResponse,
                         AuthenticationException e)
            throws IOException, ServletException {
        e.printStackTrace();
        R result = null;
        if(e instanceof BadCredentialsException){
            result = R.errorResult(HttpCodeEnum.LOGIN_ERROR, e.getMessage());
        } else if (e instanceof InsufficientAuthenticationException) {
            result = R.errorResult(HttpCodeEnum.NEED_LOGIN);
        }else {
            result = R.errorResult(HttpCodeEnum.SYSTEM_ERROR);
        }
        WebUtils.renderString(httpServletResponse, JSON.toJSONString(result));
    }
}
