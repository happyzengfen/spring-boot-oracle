package com.galaxy.base.common.aspect;

import com.galaxy.base.common.annotation.Log;
import com.galaxy.base.common.dao.LogDao;
import com.galaxy.base.common.domain.LogDO;
import com.galaxy.base.common.utils.HttpContextUtils;
import com.galaxy.base.common.utils.IPUtils;
import com.galaxy.base.common.utils.JSONUtils;
import com.galaxy.base.common.utils.ShiroUtils;
import com.galaxy.base.system.domain.UserDO;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 采用spring 中拦截器拦截所有的请求
 */
@Aspect
@Component
public class LogAspect {

	private  final Logger  logger= LoggerFactory.getLogger(LogAspect.class);
	@Autowired
	LogDao logMapper;

	@Pointcut("@annotation(com.galaxy.base.common.annotation.Log)")
	public void logPointCut() {
	}

	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		long beginTime = System.currentTimeMillis();
		// 执行方法
		Object result = point.proceed();
		// 执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;
		// 保存日志
		saveLog(point, time);
		return result;
	}

	private void saveLog(ProceedingJoinPoint joinPoint, long time) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		LogDO sysLog = new LogDO();
		Log syslog = method.getAnnotation(Log.class);
		if (syslog != null) {
			// 注解上的描述
			sysLog.setOperation(syslog.value());
		}
		// 请求的方法名
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");
		// 请求的参数
		Object[] args = joinPoint.getArgs();
		try {
			String params="";
			if(!CollectionUtils.isEmpty(CollectionUtils.arrayToList(args))){
				params= JSONUtils.beanToJson(args[0]);
			}
			sysLog.setParams(params);
		} catch (Exception e) {
			logger.error("系统异常:{}",e);
		}
		// 获取request
		HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
		// 设置IP地址
		sysLog.setIp(IPUtils.getIpAddr(request));
		// 用户名
		UserDO currUser = ShiroUtils.getUser();
		if (null == currUser) {
			if (null != sysLog.getParams()) {
				sysLog.setUserId(-1L);
				sysLog.setUsername(sysLog.getParams());
			} else {
				sysLog.setUserId(-1L);
				sysLog.setUsername("获取用户信息为空");
			}
		} else {
			sysLog.setUserId(ShiroUtils.getUserId());
			sysLog.setUsername(ShiroUtils.getUser().getUsername());
		}
		sysLog.setTime((int) time);
		// 系统当前时间
		Date date = new Date();
		sysLog.setGmtCreate(date);
		// 保存系统日志
		logMapper.save(sysLog);

		if(logger.isInfoEnabled()) {
			logger.info("记录用户操作日志信息{}",JSONUtils.beanToJson(sysLog));
		}
	}
}
