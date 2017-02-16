package com.speedata.webplus.modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.common.service.BaseService;
import com.speedata.webplus.modules.dao.GoodsDao;
import com.speedata.webplus.modules.entity.Goods;

/**
 * 商品service
 * @author ty
 * @date 2015年1月22日
 */
@Service
@Transactional(readOnly=true)
public class GoodsService extends BaseService<Goods, Integer> {
	
	@Autowired
	private GoodsDao goodsDao;

	@Override
	public BaseDaoImpl<Goods, Integer> getEntityDao() {
		return goodsDao;
	}
	
	

}
