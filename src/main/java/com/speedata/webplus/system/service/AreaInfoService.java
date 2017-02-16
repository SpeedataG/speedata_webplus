package com.speedata.webplus.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.system.dao.AreaInfoDao;
import com.speedata.webplus.system.entity.AreaInfo;

/**
 * 区域service
 */
@Service
@Transactional(readOnly=true)
public class AreaInfoService extends BaseService<AreaInfo, Integer>{
	
	@Autowired
	private AreaInfoDao areaInfoDao;
	
	@Override
	public BaseDaoImpl<AreaInfo, Integer> getEntityDao() {
		return areaInfoDao;
	}

}
