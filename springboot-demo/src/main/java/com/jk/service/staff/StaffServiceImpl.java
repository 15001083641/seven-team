package com.jk.service.staff;

import com.alibaba.fastjson.JSONObject;
import com.jk.mapper.staff.StaffMapper;
import com.jk.model.staff.StaffBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffMapper staffMapper;

        public String queryStaff(Integer tPage,Integer tNumber) {
            tPage=(tPage-1)*tNumber;
           // int total = staffMapper.queryStaff().size();
            Integer total = staffMapper.queryStaff();
            List<StaffBean> list = staffMapper.queryStaffPage(tPage,tNumber);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 0);
            jsonObject.put("msg", "");
            jsonObject.put("count", total);
            jsonObject.put("data", list);
        return jsonObject.toString();
    }

    public void deleteOne(Integer id) {
        staffMapper.deleteOne(id);
    }

    public void addInfo(StaffBean staffBean) {
        staffMapper.addInfo(staffBean);
    }

    public void deleteAll(String ids) {
     /*   String[] array = ids.split(",");*/
        staffMapper.deleteAll(ids);
    }

    public void deleOne(Integer id) {
        staffMapper.deleOne(id);
    }

    public StaffBean huiXian(Integer id) {
        return staffMapper.huiXian(id);
    }

    public void updateInfo(StaffBean staffBean) {
        staffMapper.updateInfo(staffBean);
    }

    public String queryStaffTwo(Integer page, Integer limit) {
        page=(page-1)*limit;
        int total = staffMapper.queryStaffTwo().size();
        List<StaffBean>list = staffMapper.queryStaffTwoPage(page,limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", total);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }
}
