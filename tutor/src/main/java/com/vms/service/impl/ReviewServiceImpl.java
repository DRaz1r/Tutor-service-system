package com.vms.service.impl;

import com.vms.entity.Review;
import com.vms.mapper.ReviewMapper;
import com.vms.service.ReviewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class ReviewServiceImpl extends ServiceImpl<ReviewMapper, Review> implements ReviewService {

}
