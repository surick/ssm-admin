package com.ljg.sop.service.impl;

import com.ljg.common.dao.UFileMapper;
import com.ljg.common.model.UFile;
import com.ljg.core.mybatis.BaseMybatisDao;
import com.ljg.core.mybatis.page.Pagination;
import com.ljg.sop.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * 文件管理借口实现
 *
 * @author w24164
 * @create 2018-02-11 13:00
 */
public class FileServiceImpl extends BaseMybatisDao<UFileMapper> implements FileService {
    @Autowired
    UFileMapper fileMapper;


    @Override
    public UFile addFile(UFile file) {
        fileMapper.addFile(file);
        return file;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Pagination<UFile> findPage(Map<String,Object> resultMap, Integer pageNo,
                                      Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }
}
