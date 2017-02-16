package com.speedata.webplus.system.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

/**
 * ApiParam entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "api_param", catalog = "jty")
public class ApiParam implements java.io.Serializable {

	// Fields

	private Integer id;
	private ApiInterface apiInterface;
	private String paramZhName;
	private Boolean isNull;
	private String paramCnName;
	private String remark;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Short paramType;
	private Integer sort;

	// Constructors

	/** default constructor */
	public ApiParam() {
	}

	

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "interface_id")
	@JsonBackReference
	public ApiInterface getApiInterface() {
		return this.apiInterface;
	}

	public void setApiInterface(ApiInterface apiInterface) {
		this.apiInterface = apiInterface;
	}

	@Column(name = "param_zh_name", length = 50)
	public String getParamZhName() {
		return this.paramZhName;
	}

	public void setParamZhName(String paramZhName) {
		this.paramZhName = paramZhName;
	}

	@Column(name = "is_null")
	public Boolean getIsNull() {
		return this.isNull;
	}

	public void setIsNull(Boolean isNull) {
		this.isNull = isNull;
	}

	@Column(name = "param_cn_name", length = 50)
	public String getParamCnName() {
		return this.paramCnName;
	}

	public void setParamCnName(String paramCnName) {
		this.paramCnName = paramCnName;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "create_time", length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_time", length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "param_type")
	public Short getParamType() {
		return this.paramType;
	}

	public void setParamType(Short paramType) {
		this.paramType = paramType;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

}