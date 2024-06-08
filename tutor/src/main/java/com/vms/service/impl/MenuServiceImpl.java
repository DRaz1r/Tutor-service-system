package com.vms.service.impl;

import com.vms.entity.Menu;
import com.vms.mapper.MenuMapper;
import com.vms.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

}
