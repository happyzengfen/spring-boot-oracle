package com.galaxy.base.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.galaxy.base.common.domain.LogDO;
import com.galaxy.base.common.domain.PageDO;
import com.galaxy.base.common.utils.Query;
@Service
public interface LogService {
	PageDO<LogDO> queryList(Query query);
	int remove(Long id);
	int batchRemove(Long[] ids);
}
