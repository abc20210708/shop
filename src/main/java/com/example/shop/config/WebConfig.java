package com.example.shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import java.io.IOException;

@Configuration
public class WebConfig {

    @Bean
    public CommonsMultipartResolver multipartResolver() throws IOException {
        CommonsMultipartResolver mr = new CommonsMultipartResolver();
        mr.setMaxInMemorySize(52428800); //파일 업로드 가능한 최대 크기
        mr.setDefaultEncoding("UTF-8");  // 한글 설정
        mr.setUploadTempDir(new FileSystemResource("C:\\testImg\\here"));
        return mr;
    }

}
