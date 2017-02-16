package com.speedata.webplus.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.common.utils.DateUtils;
import com.speedata.webplus.system.dao.ApiParamDao;
import com.speedata.webplus.system.entity.ApiParam;

/**
 * 参数service
 * lch
 */
@Service
@Transactional(readOnly = true)
public class ApiParamService extends BaseService<ApiParam, Integer> {

	

	@Autowired
	private ApiParamDao apiParamDao;

	@Override
	public BaseDaoImpl<ApiParam, Integer> getEntityDao() {
		return apiParamDao;
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 */
	@Transactional(readOnly = false)
	public void save(ApiParam model) {
		if (model.getId() == null) {
			model.setCreateTime(DateUtils.getSysTimestamp());
		} else {
			model.setUpdateTime(DateUtils.getSysTimestamp());
		}
		apiParamDao.save(model);
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {

		apiParamDao.delete(id);
	}

}
