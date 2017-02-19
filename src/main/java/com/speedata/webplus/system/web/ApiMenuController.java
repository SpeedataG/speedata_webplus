package com.speedata.webplus.system.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.speedata.webplus.common.persistence.Page;
import com.speedata.webplus.common.persistence.PropertyFilter;
import com.speedata.webplus.common.web.BaseController;
import com.speedata.webplus.system.entity.ApiMenu;
import com.speedata.webplus.system.entity.ApiProject;
import com.speedata.webplus.system.entity.Permission;
import com.speedata.webplus.system.entity.tree;
import com.speedata.webplus.system.service.ApiMenuService;
import com.speedata.webplus.system.service.ApiProjectService;


/**
 * 企业信息
 */
@Controller
@RequestMapping("system/api_menu")
public class ApiMenuController extends BaseController {

	@Autowired
	private ApiMenuService apiMenuService;
	@Autowired
	private ApiProjectService apiProjectService;

	/**
	 * 默认页面
	 */
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list() {
		return "system/apimenu/list";
	}

	/**
	 * 获取用户json
	 */
	@RequiresPermissions("sys:apiMenu:view")
	@RequestMapping(value="search",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Page<ApiMenu> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		page = apiMenuService.search(page, filters);
		return getEasyUIData(page);
	}

	@RequiresPermissions("sys:apiMenu:view")
	@RequestMapping(value="combotree",method = RequestMethod.GET)
	@ResponseBody
	public List<tree> combotree(HttpServletRequest request) {
		
		List<tree> list=apiMenuService.getApiMenu();
		return list;
	}
	@RequiresPermissions("sys:apiMenu:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("apiMenu", new ApiMenu());
		model.addAttribute("action", "create");
		return "system/apimenu/apiMenuForm";
	}

	
	@RequiresPermissions("sys:apiMenu:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@Valid ApiMenu apiMenu,Integer projectId, Model model) {
		System.out.print("projectId:"+projectId);
		ApiProject project=apiProjectService.get(projectId);
		apiMenu.setApiProject(project);
		apiMenuService.save(apiMenu);
		return "success";
	}

	
	@RequiresPermissions("sys:apiMenu:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("apiMenu", apiMenuService.get(id));
		model.addAttribute("action", "update");
		return "system/apimenu/apiMenuForm";
	}

	
	@RequiresPermissions("sys:apiMenu:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody ApiMenu apiMenu,Integer projectId,Model model) {
		ApiProject project=apiProjectService.get(projectId);
		apiMenu.setApiProject(project);
		apiMenuService.update(apiMenu);
		return "success";
	}

	@RequiresPermissions("sys:apiMenu:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		apiMenuService.delete(id);
		return "success";
	}

	
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getApiMenu(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("apiMenu", apiMenuService.get(id));
		}
	}

}
