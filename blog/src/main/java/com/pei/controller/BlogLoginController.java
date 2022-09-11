package com.pei.controller;

import com.pei.common.HttpCodeEnum;
import com.pei.common.R;
import com.pei.entity.User;
import com.pei.service.BlogLoginService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class BlogLoginController {

    @Resource
    private BlogLoginService blogLoginService;

    @PostMapping("/login")
    public R login(@RequestBody User user){
        return R.okResult(blogLoginService.login(user));
    }

    @PostMapping("/logout")
    public R logout(){
        blogLoginService.logout();
        return R.okResult(HttpCodeEnum.SUCCESS);
    }


}
