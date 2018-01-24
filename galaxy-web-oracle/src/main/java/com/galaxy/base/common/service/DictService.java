package com.galaxy.base.common.service;

import com.galaxy.base.common.domain.DictDO;

import java.util.List;
import java.util.Map;

/**
 * 字典表
 * 
 */
public interface DictService {
	
	DictDO get(Long id);
	
	List<DictDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DictDO sysDict);
	
	int update(DictDO sysDict);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	List<DictDO> listType();
	
	String getName(String type,String value);
}
