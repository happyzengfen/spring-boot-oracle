package com.galaxy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

/**
 * 测试类
 * @author 疯信子
 * @version 1.0
 * @date 2017-12-25
 */
@RestController
public class HelloWorldController {

    private Logger logger= LoggerFactory.getLogger(this.getClass());



    @RequestMapping("/hello")
    public String hello(String name) {

        if (logger.isDebugEnabled()) {
            logger.debug("记录日志{}", name);
        }




        return "Hello World," +name;
    }


}

