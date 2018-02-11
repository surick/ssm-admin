package com.ljg.sop.service;

import com.ljg.common.model.UFile;
import com.ljg.core.mybatis.page.Pagination;

import java.util.Map;

/**
 * FILE管理
 *
 * @author w24164
 * @create 2018-02-11 10:12
 */
public interface FileService {
    UFile addFile(UFile file);
    Pagination<UFile> findPage(Map<String,Object> resultMap,Integer pageNo,
                               Integer pageSize);
}
