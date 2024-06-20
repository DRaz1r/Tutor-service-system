package com.tutor.service.impl;

import com.tutor.entity.Review;
import com.tutor.mapper.ReviewMapper;
import com.tutor.service.ReviewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class ReviewServiceImpl extends ServiceImpl<ReviewMapper, Review> implements ReviewService {

}
