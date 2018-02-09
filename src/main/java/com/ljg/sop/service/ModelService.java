package com.ljg.sop.service;

import com.ljg.common.model.UModel;

import com.ljg.core.mybatis.page.Pagination;

import java.util.Map;

/**
 * model管理
 *
 * @author w24164
 * @create 2018-02-08 14:49
 */
public interface ModelService {
    UModel addModel(UModel model);
    int deleteModelByMid(Long mid);
    Map<String,Object> deleteModelById(String mids);
    Pagination<UModel> findPage(Map<String,Object> resultMap, Integer pageNo,
                                     Integer pageSize);

}
