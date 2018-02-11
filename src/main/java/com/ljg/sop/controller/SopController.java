package com.ljg.sop.controller;

import com.ljg.common.controller.BaseController;
import com.ljg.common.model.UFile;
import com.ljg.common.model.UModel;
import com.ljg.common.utils.LoggerUtils;
import com.ljg.core.mybatis.page.Pagination;
import com.ljg.core.shiro.token.manager.TokenManager;
import com.ljg.sop.service.FileService;
import com.ljg.sop.service.ModelService;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    FileService fileService;

    @RequestMapping(value = "model/index")
    public ModelAndView index(String findContent, ModelMap modelMap, Integer pageNo){
        modelMap.put("findContent", findContent);
        Pagination<UModel> model = modelService.findPage(modelMap,pageNo,pageSize);
        return new ModelAndView("sop/model/index","page",model);
    }

    @RequestMapping(value = "model/addModel",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addModel(UModel model){
        resultMap.put("status",400);
        model = modelService.addModel(model);
        LoggerUtils.fmtDebug(getClass(), "添加model完毕！", JSONObject.fromObject(model).toString());
        resultMap.put("message","添加MODEL成功");
        resultMap.put("status",200);
        return resultMap;
    }

    @RequestMapping(value = "model/deleteModelByMid",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteModelByMid(String mids){
        return modelService.deleteModelById(mids);
    }

    @RequestMapping(value = "file/index")
    public ModelAndView file_index(){
       /* modelMap.put("findContent",findContent);
        Pagination<UFile> file = fileService.findPage(modelMap,pageNo,pageSize);*/
        return new ModelAndView("sop/file/index");
    }

    @RequestMapping(value = "file/addFile",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addFile(HttpServletRequest request, @RequestParam("file") MultipartFile file1,
                                      @RequestParam("mid") Long mid,@RequestParam("fnum") String fnum,
                                      @RequestParam("fname") String fname,@RequestParam("fver") String fver){
        resultMap.put("status",400);
        UFile file = new UFile();
        file.setFile(file1);
        file.setFnum(fnum);
        file.setFname(fname);
        file.setMid(mid);
        file.setFver(fver);
        String fpath = file1.getOriginalFilename();
        file.setFpath(fpath);
        String email = TokenManager.getToken().getEmail();
        file.setFuser(email);
        Date date = new Date();
        file.setFtime(date);
        file = fileService.addFile(file);
        LoggerUtils.fmtDebug(getClass(), "添加文件完毕！", JSONObject.fromObject(file).toString());
        resultMap.put("message","添加文件成功");
        resultMap.put("status",200);
        return resultMap;
    }


}
