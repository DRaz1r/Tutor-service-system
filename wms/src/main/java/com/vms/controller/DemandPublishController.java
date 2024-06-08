package com.vms.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.util.StringUtils;
import com.vms.common.QueryPageParam;
import com.vms.common.Result;
import com.vms.entity.InfoPublish;
import com.vms.service.DemandPublishService;
import com.vms.service.InfoPublishService;
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
    public boolean mod(@RequestBody InfoPublish infoPublish){
        return demandPublishService.updateById(infoPublish);
    }

    //新增
    @PostMapping("/save")
    public Result save(@RequestBody InfoPublish infoPublish){
        return demandPublishService.save(infoPublish)?Result.success(null,0):Result.fail();
    }
    @GetMapping("/findByNo")
    public Result findByNo(@RequestParam String no){
        List<InfoPublish> list = demandPublishService.lambdaQuery().eq(InfoPublish::getId, no).list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }
    //新增或修改
    @PostMapping("/saveOrMod")
    public boolean saveOrMod(@RequestBody InfoPublish infoPublish){
        return demandPublishService.saveOrUpdate(infoPublish);
    }
    //删除
    @GetMapping("/delete")
    public Result delete(Integer id){
        return demandPublishService.removeById(id)?Result.success(null,0):Result.fail();
    }

    //更新
    @PostMapping("/update")
    public Result update(@RequestBody InfoPublish infoPublish){
        return demandPublishService.updateById(infoPublish)?Result.success(null,0):Result.fail();
    }

    @PostMapping("/listPage")
    public Result listPc(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String subjects =(String) param.get("subjects");
        String grades =(String) param.get("grades");
        Page<InfoPublish> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());

        LambdaQueryWrapper<InfoPublish> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(subjects)&&!"null".equals(subjects)){
            LambdaQueryWrapper.eq(InfoPublish::getSubjects,subjects);
        }
        if(!StringUtils.isNullOrEmpty(grades)&&!"null".equals(grades)){
            LambdaQueryWrapper.eq(InfoPublish::getGrades,grades);
        }

        Page<InfoPublish> page = demandPublishService.page(userPage, LambdaQueryWrapper);
        return Result.success(page.getRecords(),page.getTotal());
    }
}
