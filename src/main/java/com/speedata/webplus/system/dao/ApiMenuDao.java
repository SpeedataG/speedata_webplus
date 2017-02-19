package com.speedata.webplus.system.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;

import com.speedata.webplus.common.persistence.BaseDaoImpl;
import com.speedata.webplus.system.entity.ApiMenu;
import com.speedata.webplus.system.entity.Permission;
import com.speedata.webplus.system.entity.tree;


/**
 * api菜单
 * lch
 */
@Repository
public class ApiMenuDao extends BaseDaoImpl<ApiMenu, Integer>{
	/**
	 * 查询所有的菜单
	 * 
	 * @return 菜单集合
	 */
	@SuppressWarnings("unchecked")
	public List<tree> findApiMenu(){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.id id,p.parent_id pid,p.menu_name text,p.href url,p.sort,api_project.project_name as projectName,p.create_time createTime,p.update_time updateTime from api_menu p left join api_project  ");
		sb.append(" on p.project_id=api_project.id ");
		sb.append(" order by p.sort");
		SQLQuery sqlQuery=createSQLQuery(sb.toString());
		sqlQuery.addScalar("id",StandardBasicTypes.INTEGER );
		sqlQuery.addScalar("pid", StandardBasicTypes.INTEGER);
		sqlQuery.addScalar("text",StandardBasicTypes.STRING);
		sqlQuery.addScalar("projectName",StandardBasicTypes.STRING);
		sqlQuery.addScalar("url",StandardBasicTypes.STRING);
		sqlQuery.addScalar("sort",StandardBasicTypes.INTEGER);
		sqlQuery.addScalar("createTime",StandardBasicTypes.TIMESTAMP);
		sqlQuery.addScalar("updateTime",StandardBasicTypes.TIMESTAMP);
		sqlQuery.setResultTransformer(Transformers.aliasToBean(tree.class));
		//sqlQuery.setCacheable(true);
		return sqlQuery.list();
	}
	
}
