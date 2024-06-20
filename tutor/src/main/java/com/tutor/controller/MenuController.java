package com.tutor.controller;


import com.tutor.common.Result;
import com.tutor.entity.Menu;
import com.tutor.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/List")
    public Result findByNo(@RequestParam String roleId){
        List<Menu> list = menuService.lambdaQuery().like(Menu::getMenuright,roleId).list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }

}
