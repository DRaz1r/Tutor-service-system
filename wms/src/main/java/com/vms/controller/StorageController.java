package com.vms.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.util.StringUtils;
import com.vms.common.QueryPageParam;
import com.vms.common.Result;
import com.vms.entity.Menu;
import com.vms.entity.Storage;
import com.vms.entity.user;
import com.vms.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/storage")
public class StorageController {

    @Autowired
    private StorageService storageService;

    //修改
    @PostMapping("/mod")
    public boolean mod(@RequestBody Storage storage){
        return storageService.updateById(storage);
    }

    //新增
    @PostMapping("/save")
    public Result save(@RequestBody Storage storage){
        return storageService.save(storage)?Result.success(null,0):Result.fail();
    }

    //新增或修改
    @PostMapping("/saveOrMod")
    public boolean saveOrMod(@RequestBody Storage storage){
        return storageService.saveOrUpdate(storage);
    }
    //删除
    @GetMapping("/delete")
    public Result delete(Integer id){
        return storageService.removeById(id)?Result.success(null,0):Result.fail();
    }

    //更新
    @PostMapping("/update")
    public Result update(@RequestBody Storage storage){
        return storageService.updateById(storage)?Result.success(null,0):Result.fail();
    }

    @PostMapping("/listPage")
    public Result listPc(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String name =(String) param.get("name");

        Page<Storage> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());

        LambdaQueryWrapper<Storage> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(name)&&!"null".equals(name)){
            LambdaQueryWrapper.like(Storage::getName,name);
        }

        Page<Storage> page = storageService.page(userPage, LambdaQueryWrapper);
        return Result.success(page.getRecords(),page.getTotal());
    }

    @GetMapping("/List")
    public Result findByNo(){
        List<Storage> list = storageService.list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }

}
