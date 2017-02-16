package com.speedata.webplus.activiti.dao;

import com.speedata.webplus.activiti.entity.oa.Leave;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

/**
 * 请假实体管理接口
 *
 * @author HenryYan
 */
@Component
public interface LeaveDao extends CrudRepository<Leave, Long> {
}
