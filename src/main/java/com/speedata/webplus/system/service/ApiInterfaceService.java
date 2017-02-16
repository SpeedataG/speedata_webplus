package com.speedata.webplus.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.persistence.Finder;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.common.utils.DateUtils;
import com.speedata.webplus.system.dao.ApiInterfaceDao;
import com.speedata.webplus.system.entity.ApiInterface;

/**
 * 接口service lch
 */
@Service
@Transactional(readOnly = true)
public class ApiInterfaceService extends BaseService<ApiInterface, Integer> {

	@Autowired
	private ApiInterfaceDao apiInterfaceDao;

	@Override
	public BaseDaoImpl<ApiInterface, Integer> getEntityDao() {
		return apiInterfaceDao;
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 */
	@Transactional(readOnly = false)
	public void save(ApiInterface model) {
		if (model.getId() == null) {
			model.setCreateTime(DateUtils.getSysTimestamp());
		} else {
			model.setUpdateTime(DateUtils.getSysTimestamp());
		}
		apiInterfaceDao.save(model);
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {

		apiInterfaceDao.delete(id);
	}

	public List<ApiInterface> getlist(Integer projectId) {
		Finder finder = new Finder("from ApiInterface where  ");
		finder.append(" apiProject.projectId=:projectId");
		finder.setParam("projectId", projectId);
		finder.append(" order by id desc");
		return apiInterfaceDao.find(finder);
	}
}
