package com.vms.service.impl;

import com.vms.entity.Storage;
import com.vms.mapper.StorageMapper;
import com.vms.service.StorageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class StorageServiceImpl extends ServiceImpl<StorageMapper, Storage> implements StorageService {

}
