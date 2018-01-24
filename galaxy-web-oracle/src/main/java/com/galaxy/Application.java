package com.galaxy;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 疯信子
 * @version 1.0
 * @date 2017-12-25
 */
@EnableTransactionManagement
@ServletComponentScan
@MapperScan(basePackages={"com.galaxy.*.*.dao","com.galaxy.internal.**.persistence"})
@SpringBootApplication
public class Application {
    private static  final Logger logger= LoggerFactory.getLogger(Application.class);
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        logger.info("*****************************");
        logger.info("********spring boot start succeed *************");
        logger.info("*****************************");

    }
}
