package com.ljg.sop.service.impl;

import com.ljg.common.dao.UFileMapper;
import com.ljg.common.model.UFile;
import com.ljg.common.utils.LoggerUtils;
import com.ljg.common.utils.StringUtils;
import com.ljg.core.mybatis.BaseMybatisDao;
import com.ljg.core.mybatis.page.Pagination;
import com.ljg.sop.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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

    @Override
    public String updateFile(UFile uFile){
        fileMapper.updateFile(uFile);
        return "success";
    }

    @Override
    public int deleteFileByFid(Long fid){
        return fileMapper.deleteFileByFid(fid);
    }

    @Override
    public Map<String,Object> deleteFileById(String fids){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        try{
            int successCount=0,errorCount=0;
            String resultMsg = "删除%s条,失败%s条";
            String[] idArray = new String[]{};
            if(StringUtils.contains(fids,",")){
                idArray = fids.split(",");
            }else {
                idArray = new String[]{fids};
            }
            for(String idx : idArray){
                Long fid = new Long(idx);
                successCount += this.deleteFileByFid(fid);
                errorCount = idArray.length-successCount;
            }
            resultMap.put("status",200);
            if(errorCount > 0){
                resultMsg = String.format(resultMsg, successCount,errorCount);
            }else {
                resultMsg = "操作成功";
            }
            resultMap.put("resultMsg", resultMsg);
        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "根据FIDS删除用户出现错误，fids[%s]", fids);
            resultMap.put("status", 500);
            resultMap.put("message", "删除出现错误，请刷新后再试！");
        }
        return resultMap;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Pagination<UFile> findPage(Map<String,Object> resultMap, Integer pageNo,
                                      Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }
}
