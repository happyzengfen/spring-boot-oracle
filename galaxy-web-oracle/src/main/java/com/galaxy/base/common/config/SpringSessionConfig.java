package com.galaxy.base.common.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

@ConditionalOnProperty(prefix = "galaxy-web", name = "spring-session-open", havingValue = "true")
public class SpringSessionConfig {

}
