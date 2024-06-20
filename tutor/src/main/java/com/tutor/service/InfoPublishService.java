package com.tutor.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tutor.entity.InfoPublish;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
public interface InfoPublishService extends IService<InfoPublish> {
    Page<InfoPublish> getInfoPublishWithUsername(Page<InfoPublish> page, LambdaQueryWrapper<InfoPublish> wrapper);
}
