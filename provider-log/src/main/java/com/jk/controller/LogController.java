package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.commons.ConstantConf;
import com.jk.commons.ResultBean;
import com.jk.model.LogBean;
import com.jk.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping(value = "log")
@RefreshScope
public class LogController {

    @Autowired
    private LogService logService;

    @Value("${content}")
    private String content;

    @RequestMapping(value = "test")
    @ResponseBody
     public String test(){
        return content;
     }

    /**
     * 新增日志功能
     * @param log
     * @return
     */
    @RequestMapping(value = "insertLog")
    @ResponseBody
    public Boolean insertLog(@RequestParam String log){
        try{
            LogBean logBean = JSON.parseObject(log, LogBean.class);
            logService.insertLog(logBean);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @RequestMapping(value = "getLog")
    @ResponseBody
    public String getLog(@RequestParam Integer page,@RequestParam Integer rows){
        ResultBean resultBean = new ResultBean();
        try {
            List log = logService.getLog(page, rows);
            resultBean.setCode(ConstantConf.SUCCESS);
            resultBean.setCount(logService.getLogPage());
            resultBean.setData(log);
            resultBean.setMsg("查询成功");
            String s = JSON.toJSONString(resultBean);
            return s;

        }catch (Exception e){
            e.printStackTrace();
            resultBean.setCode(ConstantConf.EEROR);
            resultBean.setMsg(e.getMessage());
            return "失败";
        }

    }
}
