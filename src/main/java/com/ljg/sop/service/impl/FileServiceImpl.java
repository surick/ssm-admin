package com.ljg.sop.service.impl;

import com.ljg.common.dao.UFileMapper;
import com.ljg.common.model.UFile;
import com.ljg.core.mybatis.BaseMybatisDao;
import com.ljg.core.mybatis.page.Pagination;
import com.ljg.sop.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 文件管理借口实现
 *
 * @author w24164
 * @create 2018-02-11 13:00
 */
@Service("fs")
public class FileServiceImpl extends BaseMybatisDao<UFileMapper> implements FileService {
    @Autowired
    UFileMapper fileMapper;


    @Override
    public String addFile(UFile file) {
        fileMapper.addFile(file);
        return "success";
    }

    @SuppressWarnings("unchecked")
    @Override
    public Pagination<UFile> findPage(Map<String,Object> resultMap, Integer pageNo,
                                      Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }
}
