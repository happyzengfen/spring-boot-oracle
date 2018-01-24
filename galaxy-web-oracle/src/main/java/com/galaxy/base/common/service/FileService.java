package com.galaxy.base.common.service;

import com.galaxy.base.common.domain.FileDO;

import java.util.List;
import java.util.Map;

/**
 * 文件上传
 * 
 */
public interface FileService {
	
	FileDO get(Long id);
	
	List<FileDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(FileDO sysFile);
	
	int update(FileDO sysFile);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
