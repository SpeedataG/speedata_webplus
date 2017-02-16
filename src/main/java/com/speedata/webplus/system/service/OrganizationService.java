package com.speedata.webplus.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.system.dao.OrganizationDao;
import com.speedata.webplus.system.entity.Organization;

/**
 * 区域service
 */
@Service
@Transactional(readOnly=true)
public class OrganizationService extends BaseService<Organization, Integer>{
	
	@Autowired
	private OrganizationDao organizationDao;
	
	@Override
	public BaseDaoImpl<Organization, Integer> getEntityDao() {
		return organizationDao;
	}

}
