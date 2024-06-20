package com.tutor.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 获取当前项目根目录
        String userDir = System.getProperty("user.dir");
        // 动态构建相对路径
        String uploadPath = "file:" + userDir + "/src/main/resources/img/";

        // 映射路径 /uploads/** 到文件系统目录 /path/to/upload/dir/
        registry.addResourceHandler("/uploads/**").addResourceLocations(uploadPath);
    }
}