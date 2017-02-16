package com.speedata.webplus.system.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

/**
 * ApiProjectInterface entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "api_interface")
public class ApiInterface implements java.io.Serializable {

	// Fields

	private Integer id;
	private String url;
	private String title;
	private String remark;
	private String request;
	private String response;
	private Timestamp createTime;
	private Timestamp updateTime;
	private ApiMenu apiMenu;
  
	private String method;
	private Integer sort;
	private Set<ApiParam> apiParams = new HashSet<ApiParam>(0);
	private ApiProject apiProject;
	// Constructors

	/** default constructor */
	public ApiInterface() {
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	
	public ApiProject getApiProject() {
		return apiProject;
	}

	public void setApiProject(ApiProject apiProject) {
		this.apiProject = apiProject;
	}
	/*@Transient
	public String getProjectName() {
		return this.apiProject.getProjectName();
	}*/
	/** minimal constructor */
	public ApiInterface(Timestamp createTime, Timestamp updateTime) {
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

	@Column(name = "url", length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "request")
	public String getRequest() {
		return this.request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	@Column(name = "response")
	public String getResponse() {
		return this.response;
	}

	public void setResponse(String response) {
		this.response = response;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "api_menu_id")
	public ApiMenu getApiMenu() {
		return this.apiMenu;
	}

	public void setApiMenu(ApiMenu apiMenu) {
		this.apiMenu = apiMenu;
	}


	@OrderBy("sort")
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "apiInterface")
	public Set<ApiParam> getApiParams() {
		return this.apiParams;
	}

	public void setApiParams(Set<ApiParam> apiParams) {
		this.apiParams = apiParams;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	@Column(name = "method", nullable = false, length = 10)
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}