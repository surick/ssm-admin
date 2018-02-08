package com.ljg.sop.controller;

import com.ljg.common.controller.BaseController;
import com.ljg.common.model.UModel;
import com.ljg.common.utils.LoggerUtils;
import com.ljg.sop.service.ModelService;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

/**
 * sop组件
 *
 * @author w24164
 * @create 2018-02-08 14:44
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("sop")
public class SopController extends BaseController{
    @Resource
    ModelService modelService;

    @RequestMapping(value = "addModel",method = RequestMethod.GET)
    public ModelAndView model(){
        return new ModelAndView("sop/addModel");
    }

    @RequestMapping(value = "addModel",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addModel(UModel model){
        resultMap.put("status",400);
        model = modelService.addModel(model);
        LoggerUtils.fmtDebug(getClass(), "注册插入完毕！", JSONObject.fromObject(model).toString());
        resultMap.put("message","添加MODEL成功");
        resultMap.put("status",200);
        return resultMap;
    }

}
