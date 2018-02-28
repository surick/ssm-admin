package com.ljg.common.dao;

import com.ljg.common.model.UFile;

/**
 * ${DESCRIPTION}
 *
 * @author w24164
 * @create 2018-02-11 13:04
 */
public interface UFileMapper {
    int addFile(UFile file);
    int deleteFileByFid(Long fid);
}
