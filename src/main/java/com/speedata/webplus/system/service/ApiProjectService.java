package com.speedata.webplus.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.common.utils.DateUtils;
import com.speedata.webplus.system.dao.ApiProjectDao;
import com.speedata.webplus.system.entity.ApiProject;

/**
 * 接口（项目）
 * lch
 */
@Service
@Transactional(readOnly = true)
public class ApiProjectService extends BaseService<ApiProject, Integer> {


	@Autowired
	private ApiProjectDao apiProjectDao;

	@Override
	public BaseDaoImpl<ApiProject, Integer> getEntityDao() {
		return apiProjectDao;
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 */
	@Transactional(readOnly = false)
	public void save(ApiProject model) {
		if (model.getId() == null) {
			model.setCreateTime(DateUtils.getSysTimestamp());
		} else {
			model.setUpdateTime(DateUtils.getSysTimestamp());
		}
		apiProjectDao.save(model);
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {

		apiProjectDao.delete(id);
	}

}
