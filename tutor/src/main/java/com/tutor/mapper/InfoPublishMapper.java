package com.tutor.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.tutor.entity.InfoPublish;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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
public interface InfoPublishMapper extends BaseMapper<InfoPublish> {
    @Select("SELECT ip.*, u.name username FROM info_publish ip LEFT JOIN user u ON ip.user_id = u.id ${ew.customSqlSegment}")
    List<InfoPublish> selectInfoPublishWithUsername(@Param(Constants.WRAPPER) Wrapper<InfoPublish> wrapper);
}
