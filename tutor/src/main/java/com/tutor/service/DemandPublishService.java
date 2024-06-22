package com.tutor.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tutor.entity.DemandPublish;
import com.baomidou.mybatisplus.extension.service.IService;
import com.tutor.entity.InfoPublish;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
public interface DemandPublishService extends IService<DemandPublish> {
    Page<DemandPublish> getDemandPublishWithUsername(Page<DemandPublish> page, LambdaQueryWrapper<DemandPublish> wrapper);
}
