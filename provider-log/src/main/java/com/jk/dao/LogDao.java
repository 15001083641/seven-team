package com.jk.dao;

import com.jk.model.LogBean;

import java.util.List;

public interface LogDao {
    void insertLog(LogBean logBean);

    List getLog(Integer skip, Integer limit);

    Integer getLogPage();
}
