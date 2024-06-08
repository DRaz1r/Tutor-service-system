package com.vms.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.vms.common.Result;

import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/file")
public class FileController {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @PostMapping("/upload")
    public Result upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return Result.fail("文件上传失败");
        }

        // 获取当前项目根目录
        String userDir = System.getProperty("user.dir");
        // 获取文件名
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File dest = new File(userDir +'/'+ uploadDir + fileName);

        // 确保上传目录存在
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        try {
            // 保存文件
            file.transferTo(dest);
            String fileUrl = "/uploads/" + fileName; // 根据实际情况构建文件 URL
            return Result.success(fileUrl, 1);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("文件上传失败");
        }
    }
}
