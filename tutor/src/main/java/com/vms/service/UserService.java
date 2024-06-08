package com.vms.service;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.vms.entity.user;

import java.util.List;

public interface UserService extends IService<user> {
    Page pageCC(Page<user> page, Wrapper Wrapper);
}
