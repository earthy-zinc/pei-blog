package com.pei.controller;

import com.pei.common.HttpCodeEnum;
import com.pei.common.R;
import com.pei.entity.User;
import com.pei.service.UserService;
import com.pei.utils.SecurityUtils;
import com.pei.vo.UserInfoVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @GetMapping("/userInfo")
    public R getUserInfo(){
        UserInfoVo userInfoVo = userService.userInfo();
        return R.okResult(userInfoVo);
    }

    @PutMapping("/userInfo")
    public R updateUserInfo(@RequestBody User user){
        Long userId = SecurityUtils.getUserId();
        user.setId(userId);

        userService.updateById(user);
        return R.okResult(HttpCodeEnum.SUCCESS);
    }

    @PostMapping("/register")
    public R register(@RequestBody User user){
        userService.register(user);
        return R.okResult(HttpCodeEnum.SUCCESS);
    }


}
