package com.pei.schedule;

import com.pei.common.RedisCache;
import com.pei.dao.ArticleDao;
import com.pei.entity.Article;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * CommandLineRunner用于实现项目启动时的预处理
 * 使用实现了CommandLineRunner的类。springboot应用就会在启动时调用实现类的run方法
 * 执行对应的代码，需要预先在启动类上添加注解@EnableScheduling
 */
@Component
public class ViewCountRunner implements CommandLineRunner {
    @Resource
    private ArticleDao articleDao;
    @Resource
    private RedisTemplate<String, Map<String, Long>> redisTemplate;
    /**
     * 该方法在服务器应用启动时将数据库中每篇文章的访问量数据存放在redis缓存中。
     * 这样的话之后获取访问量数据就可以从redis中读取而不用访问数据库
     */
    @Override
    public void run(String... args) throws Exception {
        List<Article> articles = articleDao.selectList(null);
        Map<String, Long> viewCount = articles.stream()
                .collect(Collectors.toMap(
                article -> article.getId().toString(),
                Article::getViewCount
        ));
        redisTemplate.opsForHash().putAll("article:viewCount", viewCount);
    }
}
