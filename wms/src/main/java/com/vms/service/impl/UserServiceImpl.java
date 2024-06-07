package com.vms.service.impl;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vms.entity.user;
import com.vms.mapper.UserMapper;
import com.vms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, user> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Page pageCC(Page<user> page, Wrapper wrapper) {
        return userMapper.pageCC(page,wrapper);
    }
}
