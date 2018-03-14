package com.jk.controller.staff;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.model.staff.StaffBean;
import com.jk.service.staff.StaffService;
import com.jk.util.test.FileUtil;
import com.jk.util.test.Layui;
import com.jk.util.test.PageUtils;
import com.jk.util.test.PhotoBean;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.management.Query;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "staff")
public class StaffController {

    @Autowired
    private StaffService staffService;

    //去我的list页面
    @RequestMapping(value = "totwolist")
    public String totwolist(){
        return "staff/list";
    }

    //去list页面
    @RequestMapping(value = "tolist")
    public String tolist(){
        return "staff/show";
    }

    //上传图片
    @RequestMapping(value = "upload")
    @ResponseBody
    public Map<String,Object> upload(MultipartFile file){
       /* System.out.println(file.getOriginalFilename());
        String upFile = FileUtil.upFile(file, PhotoBean.PHOTO_PATH);
        JSONObject j =   new JSONObject();
        return  j.put("src", PhotoBean.PHOTO_PATH + upFile).toString();*/
            Map<String,Object> map = new HashMap<String, Object>();
            try {
                String upFile = FileUtil.upFile(file, PhotoBean.PHOTO_PATH);
                String path = PhotoBean.PHOTO_URL + upFile;
                map.put("success", true);
                map.put("path", path);
            } catch (Exception e) {
                e.printStackTrace();
                map.put("success", false);
            }
            return map;
        }


    //查询员工信息
    @RequestMapping(value = "queryStaffTwo")
    @ResponseBody
    public String queryStaffTwo(Integer page,Integer limit){
        String s = staffService.queryStaffTwo(page,limit);
        return s;
    }

    //查询员工信息
    @RequestMapping(value = "queryStaff")
    @ResponseBody
    public String queryStaff(Integer tPage,Integer tNumber){
        String s = staffService.queryStaff(tPage, tNumber);
        return s;
    }

    //去新增页面
    @RequestMapping(value = "toadd")
    public String toadd(){
        return "staff/add";
    }

    //单删
    @RequestMapping(value = "deleteOne")
    @ResponseBody
    public void deleteOne(Integer id){
        staffService.deleteOne(id);
    }

 //修改
    @RequestMapping(value = "updateInfo")
    @ResponseBody
    public void updateInfo(StaffBean staffBean){
        staffService.updateInfo(staffBean);
    }

    //回显
    @RequestMapping(value = "huiXian")
    @ResponseBody
    public StaffBean huiXian(Integer id){
        StaffBean staffBean = staffService.huiXian(id);
        return staffBean;
    }

    //新增
    @RequestMapping(value = "addInfo")
    @ResponseBody
    public void addInfo(StaffBean staffBean){
        if(staffBean.getId()!=null){
            staffService.updateInfo(staffBean);
        }else{
            staffService.addInfo(staffBean);
        }

    }

    //批量删除
    @RequestMapping(value = "deleteAll")
    @ResponseBody
    public HashMap deleteAll(String ids){
        HashMap<String,Object> map = new HashMap<String, Object>();
        try {
            staffService.deleteAll(ids);
            map.put("flag",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag",false);
        }
        return map;
    }

    //单删
    @RequestMapping(value = "deleOne")
    @ResponseBody
    public HashMap deleteAll(Integer id){
        HashMap<String,Object> map = new HashMap<String, Object>();
        try {
            staffService.deleOne(id);
            map.put("flag",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag",false);
        }
        return map;
    }
}
