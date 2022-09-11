package com.pei.controller;

import com.pei.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

@RestController
@Slf4j
public class CommonController {
    @Value("${pei-blog.filePath}")
    private String filePath;

    @PostMapping("/upload")
    public R upload(MultipartFile file) throws IOException{
        // 生成新的文件名，获取uuid，获取旧文件名后缀。
        String uuid = UUID.randomUUID().toString();
        String originalFilename = file.getOriginalFilename();
        assert originalFilename != null;
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String newFileName = uuid + suffix;

        // 判断是否存在当前存放文件的目录，如果不存在则创建一个
        File dir = new File(filePath);
        if(!dir.exists()){
            boolean isMk = dir.mkdirs();
            log.info("{}创建目录{}", isMk ? "成功" : "失败" , filePath);
        }

        // 存储文件到指定目录
        file.transferTo(new File(filePath+newFileName));

        return R.okResult(newFileName);
    }

    @RequestMapping("/download")
    public void download(String name, HttpServletResponse response) throws IOException{
        FileInputStream inputStream = new FileInputStream(filePath+name);

        ServletOutputStream outputStream = response.getOutputStream();
        response.setContentType("image/jpeg");

        int len = 0;
        byte[] bytes = new byte[1024];
        while ((len = inputStream.read(bytes)) != -1){
            outputStream.write(bytes, 0, len);
            outputStream.flush();
        }

        outputStream.close();
        inputStream.close();
    }
}
