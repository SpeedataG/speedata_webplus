package com.speedata.webplus.system.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ApiProject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "api_project")
public class ApiProject implements java.io.Serializable {

	// Fields

	private Integer id;
	private String projectName;
	private String remark;
	private Timestamp createTime;
	private Timestamp updateTime;
	private Set<ApiInterface> apiInterfaces = new HashSet<ApiInterface>(0);
	private Set<ApiMenu> apiMenus = new HashSet<ApiMenu>(0);
	// Constructors

	/** default constructor */
	public ApiProject() {
	}

	@OrderBy("sort")
	@OneToMany(  cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "apiProject")
	public Set<ApiInterface> getApiInterfaces() {
		return apiInterfaces;
	}
	
	public void setApiInterfaces(Set<ApiInterface> apiInterfaces) {
		this.apiInterfaces = apiInterfaces;
	}
	@OrderBy("sort")
	@OneToMany(  cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "apiProject")
	public Set<ApiMenu> getApiMenus() {
		return apiMenus;
	}
	public void setApiMenus(Set<ApiMenu> apiMenus) {
		this.apiMenus = apiMenus;
	}
	/** minimal constructor */
	public ApiProject(Timestamp createTime, Timestamp updateTime) {
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	/** full constructor */
	public ApiProject(String projectName, String remark, Timestamp createTime,
			Timestamp updateTime) {
		this.projectName = projectName;
		this.remark = remark;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

	@Column(name = "project_name", length = 100)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "create_time", nullable = false, length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_time", nullable = false, length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

}