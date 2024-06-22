package com.tutor.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tutor.entity.DemandPublish;
import com.tutor.entity.InfoPublish;
import com.tutor.mapper.DemandPublishMapper;
import com.tutor.service.DemandPublishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
@Service
public class DemandPublishServiceImpl extends ServiceImpl<DemandPublishMapper, DemandPublish> implements DemandPublishService {
    public Page<DemandPublish> getDemandPublishWithUsername(Page<DemandPublish> page, LambdaQueryWrapper<DemandPublish> wrapper) {
        List<DemandPublish> records = this.baseMapper.selectDemandPublishWithUsername(page, wrapper);
        page.setRecords(records);
        return page;
    }
}
