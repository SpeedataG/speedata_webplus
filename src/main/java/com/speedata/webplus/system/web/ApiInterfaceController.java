package com.speedata.webplus.system.web;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.speedata.webplus.system.dto.ApiInterfaceDto;
import com.speedata.webplus.system.entity.ApiInterface;
import com.speedata.webplus.system.entity.ApiMenu;
import com.speedata.webplus.system.entity.ApiProject;
import com.speedata.webplus.system.service.ApiInterfaceService;
import com.speedata.webplus.system.service.ApiMenuService;
import com.speedata.webplus.system.service.ApiProjectService;

/**
 * 企业信息
 */
@Controller
@RequestMapping("system/api_interface")
public class ApiInterfaceController extends BaseController {

	@Autowired
	private ApiInterfaceService apiInterfaceService;
	@Autowired
	private ApiProjectService apiProjectService;
	@Autowired
	private ApiMenuService apiMenuService;
	/**
	 * 默认页面
	 */
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list() {
		return "system/apiinterface/list";
	}

	/**
	 * 获取用户json
	 */
	@RequiresPermissions("sys:apiInterface:view")
	@RequestMapping(value="search",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Page<ApiInterface> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		page = apiInterfaceService.search(page, filters);
		List<ApiInterface>  list=page.getResult();
		List<ApiInterfaceDto> dtolist=new ArrayList<ApiInterfaceDto>();
		for(ApiInterface model:list){
			ApiInterfaceDto dto=new ApiInterfaceDto();
			dto.setCreateTime(model.getCreateTime());
			dto.setUpdateTime(model.getUpdateTime());
			dto.setId(model.getId());
			dto.setProjectName(model.getApiProject().getProjectName());
			dto.setTitle(model.getTitle());
			dto.setSort(model.getSort());
			dto.setMethod(model.getMethod());
			dtolist.add(dto);
		}
		Page<ApiInterfaceDto> page_new=new Page<ApiInterfaceDto>(page.getPageNo(), page.getPageSize(),page.getOrderBy(), page.getOrder());
		page_new.setResult(dtolist);
		page_new.setTotalCount(page.getTotalCount());
		return getEasyUIData(page_new);
	}

	
	@RequiresPermissions("sys:apiInterface:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("apiInterface", new ApiInterface());
		model.addAttribute("action", "create");
		return "system/apiinterface/apiInterfaceForm";
	}

	
	@RequiresPermissions("sys:apiInterface:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@Valid ApiInterface apiInterface,Integer projectId,Integer apiMenuId, Model model) {
		System.out.print("projectId:"+projectId);
		System.out.println("menuId:"+apiMenuId);
		ApiProject project=apiProjectService.get(projectId);
		ApiMenu  menu=apiMenuService.get(apiMenuId);
		apiInterface.setApiMenu(menu);
	    apiInterface.setApiProject(project);
		apiInterface.setCreateTime(new Timestamp(System.currentTimeMillis()));
		apiInterfaceService.save(apiInterface);
		return "success";
	}

	
	@RequiresPermissions("sys:apiInterface:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("apiInterface", apiInterfaceService.get(id));
		model.addAttribute("action", "update");
		return "system/apiinterface/apiInterfaceForm";
	}

	
	@RequiresPermissions("sys:apiInterface:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody ApiInterface apiInterface,Integer projectId,Integer apiMenuId,Model model) {
		ApiProject project=apiProjectService.get(projectId);
		ApiMenu  menu=apiMenuService.get(apiMenuId);
		apiInterface.setApiMenu(menu);
	    apiInterface.setApiProject(project);
		apiInterface.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		apiInterfaceService.update(apiInterface);
		return "success";
	}

	@RequiresPermissions("sys:apiInterface:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		apiInterfaceService.delete(id);
		return "success";
	}

	
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getApiInterface(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("apiInterface", apiInterfaceService.get(id));
		}
	}

}
