package com.tutor.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.util.StringUtils;
import com.tutor.common.QueryPageParam;
import com.tutor.common.Result;
import com.tutor.entity.DemandPublish;
import com.tutor.service.DemandPublishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
@RestController
@RequestMapping("/demandpublish")
public class DemandPublishController {

    @Autowired
    private DemandPublishService demandPublishService;

    //修改
    @PostMapping("/mod")
    public boolean mod(@RequestBody DemandPublish demandPublish){
        return demandPublishService.updateById(demandPublish);
    }

    //新增
    @PostMapping("/save")
    public Result save(@RequestBody DemandPublish demandPublish){
        return demandPublishService.save(demandPublish)?Result.success(null,0):Result.fail();
    }
    @GetMapping("/findByNo")
    public Result findByNo(@RequestParam String no){
        List<DemandPublish> list = demandPublishService.lambdaQuery().eq(DemandPublish::getId, no).list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }
    //新增或修改
    @PostMapping("/saveOrMod")
    public boolean saveOrMod(@RequestBody DemandPublish demandPublish){
        return demandPublishService.saveOrUpdate(demandPublish);
    }
    //删除
    @GetMapping("/delete")
    public Result delete(Integer id){
        return demandPublishService.removeById(id)?Result.success(null,0):Result.fail();
    }

    //更新
    @PostMapping("/update")
    public Result update(@RequestBody DemandPublish demandPublish){
        return demandPublishService.updateById(demandPublish)?Result.success(null,0):Result.fail();
    }

    @PostMapping("/listPage")
    public Result listPc(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String subject =(String) param.get("subject");
        String grade =(String) param.get("grade");

        Page<DemandPublish> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());

        LambdaQueryWrapper<DemandPublish> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(subject)&&!"null".equals(subject)){
            LambdaQueryWrapper.eq(DemandPublish::getSubjects,subject);
        }
        if(!StringUtils.isNullOrEmpty(grade)&&!"null".equals(grade)){
            LambdaQueryWrapper.eq(DemandPublish::getGrades,grade);
        }

        Page<DemandPublish> page = demandPublishService.page(userPage, LambdaQueryWrapper);
        return Result.success(page.getRecords(),page.getTotal());
    }
}