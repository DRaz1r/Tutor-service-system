package com.tutor.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.util.StringUtils;
import com.tutor.common.QueryPageParam;
import com.tutor.common.Result;
import com.tutor.entity.Review;
import com.tutor.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    //修改
    @PostMapping("/mod")
    public boolean mod(@RequestBody Review review){
        return reviewService.updateById(review);
    }

    //新增
    @PostMapping("/save")
    public Result save(@RequestBody Review review){
        return reviewService.save(review)?Result.success(null,0):Result.fail();
    }

    //新增或修改
    @PostMapping("/saveOrMod")
    public boolean saveOrMod(@RequestBody Review review){
        return reviewService.saveOrUpdate(review);
    }
    //删除
    @GetMapping("/delete")
    public Result delete(Integer id){
        return reviewService.removeById(id)?Result.success(null,0):Result.fail();
    }

    //更新
    @PostMapping("/update")
    public Result update(@RequestBody Review review){
        return reviewService.updateById(review)?Result.success(null,0):Result.fail();
    }

    @PostMapping("/listPage")
    public Result listPc(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String name =(String) param.get("name");

        Page<Review> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());

        LambdaQueryWrapper<Review> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(name)&&!"null".equals(name)){
            LambdaQueryWrapper.like(Review::getName,name);
        }

        Page<Review> page = reviewService.page(userPage, LambdaQueryWrapper);
        return Result.success(page.getRecords(),page.getTotal());
    }

    @GetMapping("/List")
    public Result findByNo(){
        List<Review> list = reviewService.list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }

}
