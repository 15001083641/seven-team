package com.jk.dao;

import com.jk.model.LogBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LogDaoImpl implements LogDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public void insertLog(LogBean logBean) {
        mongoTemplate.insert(logBean,"log");
    }

    @Override
    public List getLog(Integer skip, Integer limit) {
        return mongoTemplate.find(new Query().skip(skip).limit(limit),LogBean.class,"log");
    }

    @Override
    public Integer getLogPage() {
        return (int)mongoTemplate.count(new Query(),LogBean.class,"log");
    }
}
