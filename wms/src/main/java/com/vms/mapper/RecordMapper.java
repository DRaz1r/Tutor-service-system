package com.vms.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.vms.entity.Record;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.vms.entity.RecordRes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Wrapper;


@Mapper
public interface RecordMapper extends BaseMapper<Record> {

    IPage pageCC(IPage<RecordRes> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
