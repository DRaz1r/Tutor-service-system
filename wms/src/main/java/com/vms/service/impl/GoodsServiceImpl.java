package com.vms.service.impl;

import com.vms.entity.Goods;
import com.vms.mapper.GoodsMapper;
import com.vms.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

}
