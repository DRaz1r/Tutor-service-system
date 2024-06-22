package com.tutor.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tutor.entity.DemandPublish;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tutor.entity.InfoPublish;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
public interface DemandPublishMapper extends BaseMapper<DemandPublish> {
    @Select("SELECT dp.*, u.name username FROM demand_publish dp LEFT JOIN user u ON dp.user_id = u.id ${ew.customSqlSegment}")
    List<DemandPublish> selectDemandPublishWithUsername(Page<DemandPublish> page, @Param(Constants.WRAPPER) Wrapper<DemandPublish> wrapper);
}
