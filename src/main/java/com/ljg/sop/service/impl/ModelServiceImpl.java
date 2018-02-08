package com.ljg.sop.service.impl;

import com.ljg.common.dao.UModelMapper;
import com.ljg.common.model.UModel;
import com.ljg.core.mybatis.BaseMybatisDao;
import com.ljg.sop.service.ModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * model管理接口实现
 *
 * @author w24164
 * @create 2018-02-08 15:28
 */
@Service
public class ModelServiceImpl extends BaseMybatisDao<UModelMapper> implements ModelService{
    @Autowired
    UModelMapper modelMapper;

    @Override
    public UModel addModel(UModel model) {
        modelMapper.addModel(model);
        return model;
    }

    @Override
    public UModel selectModelByGroup(Long gid) {
        return modelMapper.selectModelByGroup(gid);
    }

    @Override
    public int deleteModelById(Long mid) {
        return modelMapper.deleteModelById(mid);
    }
}
