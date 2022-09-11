package com.pei.config;

import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.ToStringSerializer;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    /**
     * 从名字可以看出，这是一个添加允许跨域访问的服务器资源路径、访问域名等等映射路径
     * 我们在这里配置与跨域相关的属性
     * 这里是针对springBoot的配置，配置完成后，纯springBoot项目，不会对跨域请求拦截，可以执行跨域请求
     * 在添加额外的安全框架后，还需要再安全框架的配置里对跨域进行配置，否则，安全框架会拦截
     * @param registry 方便我们修改跨域配置的注册器
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        /* addMapping 设置允许跨域的路径，对于本服务器向外暴露的所有api都允许跨域访问
           allowedOriginPatterns 设置允许跨域请求的源主机域名，即前端的协议、ip地址、端口号
           allowCredentials 是否允许凭证存在，也就是cookie
           allowedMethods 设置允许的请求方式
           allowedHeaders 设置允许的header属性
           maxAge 跨域请求允许时间，单位：秒
         */
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "DELETE", "PUT")
                .allowedHeaders("*")
                .maxAge(3600);
    }

    @Bean//使用@Bean注入fastJsonHttpMessageConvert
    public HttpMessageConverter fastJsonHttpMessageConverters() {
        //1.需要定义一个Convert转换消息的对象
        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm:ss");

        SerializeConfig.globalInstance.put(Long.class, ToStringSerializer.instance);

        fastJsonConfig.setSerializeConfig(SerializeConfig.globalInstance);
        fastConverter.setFastJsonConfig(fastJsonConfig);
        return fastConverter;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(fastJsonHttpMessageConverters());
    }
}
