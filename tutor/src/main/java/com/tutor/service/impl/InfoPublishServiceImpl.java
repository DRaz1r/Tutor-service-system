package com.tutor.service.impl;

import com.tutor.entity.InfoPublish;
import com.tutor.mapper.InfoPublishMapper;
import com.tutor.service.InfoPublishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

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
public class InfoPublishServiceImpl extends ServiceImpl<InfoPublishMapper, InfoPublish> implements InfoPublishService {
    public Page<InfoPublish> getInfoPublishWithUsername(Page<InfoPublish> page, LambdaQueryWrapper<InfoPublish> wrapper) {
        List<InfoPublish> records = this.baseMapper.selectInfoPublishWithUsername(wrapper);
        page.setRecords(records);
        return page;
    }
}
