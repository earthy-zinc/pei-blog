package com.pei.utils;

import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

public class BeanCopy {
    private BeanCopy(){}

    public static <V> V copyBean(Object source, Class<V> cls){
        V result = null;
        try{
            result = cls.newInstance();
            BeanUtils.copyProperties(source, result);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public static <O, V> List<V> copyBeanList(List<O> list, Class<V> cls){
        return list.stream()
                .map(item -> copyBean(item, cls))
                .collect(Collectors.toList());
    }
}
