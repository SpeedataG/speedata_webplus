package com.speedata.webplus.modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.modules.dao.GoodsTypeDao;
import com.speedata.webplus.modules.entity.GoodsType;

/**
 * 商品类型service
 * @author ty
 * @date 2015年1月22日
 */
@Service
@Transactional(readOnly=true)
public class GoodsTypeService extends BaseService<GoodsType, Integer> {
	
	@Autowired
	private GoodsTypeDao goodsTypeDao;

	@Override
	public BaseDaoImpl<GoodsType, Integer> getEntityDao() {
		return goodsTypeDao;
	}

}
