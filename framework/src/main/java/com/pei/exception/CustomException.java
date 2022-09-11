package com.pei.exception;

import com.pei.common.HttpCodeEnum;
import lombok.Getter;

@Getter
public class CustomException extends RuntimeException{
    private int code;
    private String message;

    public CustomException(String msg){
        super(msg);
        this.message = msg;
    }

    public CustomException(HttpCodeEnum httpCodeEnum){
        super(httpCodeEnum.getMsg());
        this.code = httpCodeEnum.getCode();
        this.message = httpCodeEnum.getMsg();
    }

}
