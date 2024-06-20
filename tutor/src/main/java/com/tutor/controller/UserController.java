package com.tutor.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.util.StringUtils;
import com.tutor.common.QueryPageParam;
import com.tutor.common.Result;
import com.tutor.entity.Menu;

import com.tutor.entity.User;
import com.tutor.service.MenuService;
import com.tutor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    @GetMapping("/list")
    public List<User> list(){
        return userService.list();
    }
    @GetMapping("/findByNo")
    public Result findByNo(@RequestParam String no){
        List<User> list = userService.lambdaQuery().eq(User::getNo, no).list();
        return list.size()>0?Result.success(list,list.size()):Result.fail();
    }
    //新增
    @PostMapping("/save")
    public Result save(@RequestBody User user){
        return userService.save(user)?Result.success(null,0):Result.fail();
    }
    //更新
    @PostMapping("/update")
    public Result update(@RequestBody User user){
        return userService.updateById(user)?Result.success(null,0):Result.fail();
    }
    //登录
    @PostMapping("/login")
    public Result login(@RequestBody User user){
        List<User> eq = userService.lambdaQuery().eq(User::getNo, user.getNo())
                .eq(User::getPassword, user.getPassword()).list();
        if(eq.size()>0){
            User user1 = eq.get(0);
            List<Menu> list = menuService.lambdaQuery().like(Menu::getMenuright, user1.getRoleId()).list();
            HashMap<Object, Object> objectObjectHashMap = new HashMap<>();
            objectObjectHashMap.put("user",user1);
            objectObjectHashMap.put("menu",list);
            return Result.success(objectObjectHashMap,objectObjectHashMap.size());
        }
        return Result.fail();
    }
    //修改
    @PostMapping("/mod")
    public boolean mod(@RequestBody User user){
        return userService.updateById(user);
    }
    //新增或修改
    @PostMapping("/saveOrMod")
    public boolean saveOrMod(@RequestBody User user){
        return userService.saveOrUpdate(user);
    }
    //删除
    @GetMapping("/delete")
    public Result delete(Integer id){
        return userService.removeById(id)?Result.success(null,0):Result.fail();
    }
    //查询（模糊，匹配）
    @PostMapping("/listP")
    public Result listP(@RequestBody User user){
        LambdaQueryWrapper<User> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(user.getName())){
            LambdaQueryWrapper.eq(User::getName,user.getName());
        }
        return Result.success(userService.list(LambdaQueryWrapper),userService.list(LambdaQueryWrapper).stream().count());
    }

    @PostMapping("/listPage")
    public List<User> listP(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String name =(String) param.get("name");
        Page<User> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());

        LambdaQueryWrapper<User> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper.like(User::getName,name);

        Page<User> page = userService.page(userPage, LambdaQueryWrapper);
        System.out.println(page.getTotal());
        return page.getRecords();
    }
    @PostMapping("/listPageC")
    public Result listPc(@RequestBody QueryPageParam query){
        HashMap param = query.getParam();
        String name =(String) param.get("name");
        String sex =(String) param.get("sex");
        String roleId = (String) param.get("roleId");
        Page<User> userPage = new Page<>();
        userPage.setCurrent(query.getPageNum());
        userPage.setSize(query.getPageSize());
        LambdaQueryWrapper<User> LambdaQueryWrapper = new LambdaQueryWrapper<>();
        if(!StringUtils.isNullOrEmpty(name)&&!"null".equals(name)){
            LambdaQueryWrapper.like(User::getName,name);
        }
        if(!StringUtils.isNullOrEmpty(sex)&&!"null".equals(sex)){
            LambdaQueryWrapper.like(User::getSex,sex);
        }
        if (!StringUtils.isNullOrEmpty(roleId)){
            LambdaQueryWrapper.eq(User::getRoleId,roleId);
        }
        Page<User> page = userService.page(userPage, LambdaQueryWrapper);
        return Result.success(page.getRecords(),page.getTotal());
    }
}
