package com.pei.service;

import com.pei.entity.User;
import com.pei.vo.BlogUserLoginVo;

public interface BlogLoginService {
    BlogUserLoginVo login(User user);

    void logout();
}
