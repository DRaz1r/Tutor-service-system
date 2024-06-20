package com.tutor.service;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tutor.entity.User;

public interface UserService extends IService<User> {
    Page pageCC(Page<User> page, Wrapper Wrapper);
}
