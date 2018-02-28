package com.ljg.sop.service.impl;

import com.ljg.common.dao.UModelMapper;
import com.ljg.common.model.UModel;
import com.ljg.common.utils.LoggerUtils;
import com.ljg.common.utils.StringUtils;
import com.ljg.core.mybatis.BaseMybatisDao;
import com.ljg.core.mybatis.page.Pagination;
import com.ljg.sop.service.ModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * model管理接口实现
 *
 * @author w24164
 * @create 2018-02-08 15:28
 */
@Service("ms")
public class ModelServiceImpl extends BaseMybatisDao<UModelMapper> implements ModelService{
    @Autowired
    UModelMapper modelMapper;

    @Override
    public UModel addModel(UModel model) {
        modelMapper.addModel(model);
        return model;
    }

    @Override
    public int deleteModelByMid(Long mid) {
        return modelMapper.deleteModelByMid(mid);
    }

    @Override
    public Map<String,Object> deleteModelById(String mids){
        Map<String,Object> resultMap = new HashMap<String, Object>();
        try{
            int successCount=0,errorCount=0;
            String resultMsg ="删除%s条，失败%s条";
            String[] idArray = new String[]{};
            if(StringUtils.contains(mids, ",")){
                idArray = mids.split(",");
            }else{
                idArray = new String[]{mids};
            }

            for (String idx : idArray) {
                Long mid = new Long(idx);
                successCount += this.deleteModelByMid(mid);
                errorCount = idArray.length-successCount;
                //List<UModel> models= modelMapper.findModelByMid(mid);
                //if(null != models && models.size() > 0){
                //    errorCount += models.size();
                //}else{
                //    successCount+=this.deleteModelByMid(mid);
                //}
            }
            resultMap.put("status", 200);
            //如果有成功的，也有失败的，提示清楚。
            if(errorCount > 0){
                resultMsg = String.format(resultMsg, successCount,errorCount);
            }else{
                resultMsg = "操作成功";
            }
            resultMap.put("resultMsg", resultMsg);
        } catch (Exception e) {
            LoggerUtils.fmtError(getClass(), e, "根据MIDS删除用户出现错误，mids[%s]", mids);
            resultMap.put("status", 500);
            resultMap.put("message", "删除出现错误，请刷新后再试！");
        }
        return resultMap;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Pagination<UModel> findPage(Map<String,Object> resultMap, Integer pageNo,
                                            Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }
}
