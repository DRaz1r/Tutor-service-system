package com.tutor.service.impl;

import com.tutor.entity.Menu;
import com.tutor.mapper.MenuMapper;
import com.tutor.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

}
