package com.jk.service.staff;

import com.jk.model.staff.StaffBean;

import java.util.List;

public interface StaffService {

    String queryStaff(Integer tPage, Integer tNumber);

    void deleteOne(Integer id);

    void addInfo(StaffBean staffBean);

    void deleteAll(String ids);

    void deleOne(Integer id);

    StaffBean huiXian(Integer id);

    void updateInfo(StaffBean staffBean);

    String queryStaffTwo(Integer page, Integer limit);
}
