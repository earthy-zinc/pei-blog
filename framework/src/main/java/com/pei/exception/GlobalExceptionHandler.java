package com.pei.exception;

import com.pei.common.HttpCodeEnum;
import com.pei.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(CustomException.class)
    public R customExceptionHandler(CustomException e){
        return R.errorResult(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public R exceptionHandler(Exception e){
        //打印异常信息
        log.error("出现了异常！ {}",e);
        //从异常对象中获取提示信息封装返回
        return R.errorResult(HttpCodeEnum.SYSTEM_ERROR.getCode(),e.getMessage());
    }
}
