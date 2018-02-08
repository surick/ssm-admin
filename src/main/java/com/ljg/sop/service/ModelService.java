package com.ljg.sop.service;

import com.ljg.common.model.UModel;

/**
 * model管理
 *
 * @author w24164
 * @create 2018-02-08 14:49
 */
public interface ModelService {
    UModel addModel(UModel model);
    UModel selectModelByGroup(Long gid);
    int deleteModelById(Long mid);

}
