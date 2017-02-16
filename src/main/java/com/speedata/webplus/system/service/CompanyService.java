package com.speedata.webplus.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.common.utils.DateUtils;
import com.speedata.webplus.system.dao.CompanyDao;
import com.speedata.webplus.system.entity.Company;

/**
 * 用户service
 */
@Service
@Transactional(readOnly = true)
public class CompanyService extends BaseService<Company, Integer> {

	/** 加密方法 */
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8; // 盐长度

	@Autowired
	private CompanyDao companyDao;

	@Override
	public BaseDaoImpl<Company, Integer> getEntityDao() {
		return companyDao;
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 */
	@Transactional(readOnly = false)
	public void save(Company model) {
		if (model.getId() == null) {
			model.setCreateTime(DateUtils.getSysTimestamp());
		} else {
			model.setUpdateTime(DateUtils.getSysTimestamp());
		}
		companyDao.save(model);
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {

		companyDao.delete(id);
	}

}
