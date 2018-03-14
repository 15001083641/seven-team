package com.jk.service;

import com.jk.dao.LogDao;
import com.jk.model.LogBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogDao logDao;

    @Override
    public void insertLog(LogBean logBean) {
        logDao.insertLog(logBean);
    }

    @Override
    public List getLog(Integer page, Integer rows) {
        Integer skip =0;
        Integer limit=5;

        skip=(page-1)*rows;
        limit=rows;
        return logDao.getLog(skip,limit);
    }

    @Override
    public Integer getLogPage() {
        return logDao.getLogPage();
    }
}
