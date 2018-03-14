package com.jk.service;

import com.jk.model.LogBean;

import java.util.List;

public interface LogService {

    void insertLog(LogBean logBean);

    List getLog(Integer page, Integer rows);

    Integer getLogPage();
}
