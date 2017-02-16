package com.speedata.webplus.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.persistence.Finder;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.common.utils.DateUtils;
import com.speedata.webplus.system.dao.ApiMenuDao;
import com.speedata.webplus.system.entity.ApiInterface;
import com.speedata.webplus.system.entity.ApiMenu;
import com.speedata.webplus.system.entity.Permission;
import com.speedata.webplus.system.entity.tree;

/**
 * 用户service
 */
@Service
@Transactional(readOnly = true)
public class ApiMenuService extends BaseService<ApiMenu, Integer> {

	/** 加密方法 */
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8; // 盐长度

	@Autowired
	private ApiMenuDao apiMenuDao;

	@Override
	public BaseDaoImpl<ApiMenu, Integer> getEntityDao() {
		return apiMenuDao;
	}

	/**
	 * 保存用户
	 * 
	 * @param
	 */
	@Transactional(readOnly = false)
	public void save(ApiMenu model) {
		if (model.getId() == null) {
			model.setCreateTime(DateUtils.getSysTimestamp());
		} else {
			model.setUpdateTime(DateUtils.getSysTimestamp());
		}
		apiMenuDao.save(model);
	}
	/**
	 * 获取所有菜单
	 * @return 菜单集合
	 */
	public List<tree> getApiMenu(){
		return apiMenuDao.findApiMenu();
	}
	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {

		apiMenuDao.delete(id);
	}
	public List<ApiMenu> getlist(Integer parentId) {
		Finder finder = new Finder("from ApiMenu where  ");
		
		if(parentId.equals(0)){
			finder.append(" parentId is NULL");
		}else{
			finder.append(" parentId=:parentId");
			finder.setParam("parentId", parentId);
		}
		finder.append(" order by sort ");
		return apiMenuDao.find(finder);
	}
}
