package com.speedata.webplus.system.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ApiMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "api_menu")
public class ApiMenu implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer parentId;
	private String menuName;
	private String href;
	private String remark;
	private Timestamp createTime;
	private Timestamp updateTime;
    private Integer sort;
    private ApiProject apiProject;
	// Constructors

	private List<ApiMenu> childlist=new ArrayList<ApiMenu>();


	/** default constructor */
	public ApiMenu() {
	}

	/** minimal constructor */
	public ApiMenu(Timestamp createTime, Timestamp updateTime) {
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	/** full constructor */
	public ApiMenu(Integer parentId, String menuName, String href,
			String remark, Timestamp createTime, Timestamp updateTime) {
		this.parentId = parentId;
		this.menuName = menuName;
		this.href = href;
		this.remark = remark;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public ApiProject getApiProject() {
		return apiProject;
	}
	public void setApiProject(ApiProject apiProject) {
		this.apiProject=apiProject;
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

	@Column(name = "parent_id")
	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "menu_name", length = 50)
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "href", length = 50)
	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
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
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Transient
	public List<ApiMenu> getChildlist() {
		return childlist;
	}

	public void setChildlist(List<ApiMenu> childlist) {
		this.childlist = childlist;
	}
}