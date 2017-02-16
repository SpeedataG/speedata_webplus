package com.speedata.webplus.modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.modules.dao.AdverDao;
import com.speedata.webplus.modules.entity.Adver;

/**
 * 广告service
 * @author ty
 * @date 2015年1月22日
 */
@Service
@Transactional(readOnly=true)
public class AdverService extends BaseService<Adver, Integer>{
	
	@Autowired
	private AdverDao adverDao;

	@Override
	public BaseDaoImpl<Adver, Integer> getEntityDao() {
		return adverDao;
	}

}
