package com.ljg.common.dao;

import com.ljg.common.model.UModel;

import java.util.List;

/**
 *model mapper 接口
 *
 *@author w24164
 *@create 2018-02-08 15:32
 */
public interface UModelMapper {
    int addModel(UModel model);
    int deleteModelByMid(Long mid);
    List<UModel> findModelByMid(Long mid);

}
