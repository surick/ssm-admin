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
    String addFile(UFile file);
    String updateFile(UFile uFile);
    int deleteFileByFid(Long fid);
    Map<String,Object> deleteFileById(String fids);
    Pagination<UFile> findPage(Map<String,Object> resultMap,Integer pageNo,
                               Integer pageSize);
}
