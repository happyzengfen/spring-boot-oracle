package com.galaxy.base.common.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import com.galaxy.base.common.utils.ShiroUtils;
import com.galaxy.base.system.domain.UserDO;



@Controller
public class BaseController {
	protected final Logger logger= LoggerFactory.getLogger(this.getClass());
	public UserDO getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}