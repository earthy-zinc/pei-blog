package com.pei.schedule;

import com.pei.common.RedisCache;
import com.pei.entity.Article;
import com.pei.service.ArticleService;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class UpdateViewCountJob {
    @Resource
    private RedisTemplate<String, Map<String, Long>> redisTemplate;
    @Resource
    private ArticleService articleService;

    /**
     * 每隔十分钟把redis中的浏览量更新到数据库中
     * 0 10 * * * ? *
     * 注意踩坑，我们往redis中存放的访问量这个变量的数据类型为Long
     * 但是redis在返回数据却是Integer类型
     * 实际在redis存的是具体的数字，那么当读取的时候，代码并不知道缓存中的数字到底是Integer类型还是Long类型
     * 于是乎会使用实际数字的值进行自动转换——也就是说返回Integer类型，而强转会报异常因此我们先用Number来承接返回值
     * 随后使用.longValue()方法转换成Long类型。
     */
    @Scheduled(cron = "* 20 * * * ? ")
    public void updateViewCount(){
        HashOperations<String, String, Long> hashOperations = redisTemplate.opsForHash();

        //取值
        Map<String, Long> viewCount = hashOperations.entries("article:viewCount");
        List<Article> articles = viewCount.entrySet().stream().map(entry -> {
            Long id = Long.valueOf(entry.getKey());
            Number value = entry.getValue();
            return new Article(id, value.longValue());
        }).collect(Collectors.toList());

        articleService.updateBatchById(articles);
    }
}
