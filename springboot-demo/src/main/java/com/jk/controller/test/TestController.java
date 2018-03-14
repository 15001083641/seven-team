package com.jk.controller.test;

import com.jk.service.test.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    //测试
    @RequestMapping(value = "test")
    public String test(){
        int count = testService.getCount();
        System.out.println(count);
        return "test";
    }



}
