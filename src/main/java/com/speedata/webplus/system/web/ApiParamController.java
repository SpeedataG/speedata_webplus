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
import com.speedata.webplus.system.entity.ApiInterface;
import com.speedata.webplus.system.entity.ApiParam;
import com.speedata.webplus.system.service.ApiInterfaceService;
import com.speedata.webplus.system.service.ApiParamService;

/**
 * 企业信息
 */
@Controller
@RequestMapping("system/api_param")
public class ApiParamController extends BaseController {

	@Autowired
	private ApiParamService apiParamService;
	@Autowired
	private ApiInterfaceService apiInterfaceService;
	/**
	 * 默认页面
	 */
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list() {
		return "system/apiparam/list";
	}

	/**
	 * 获取用户json
	 */
	@RequiresPermissions("sys:apiParam:view")
	@RequestMapping(value="search",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Page<ApiParam> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		PropertyFilter  pf=new PropertyFilter();
		
		page = apiParamService.search(page, filters);
		return getEasyUIData(page);
	}

	
	@RequiresPermissions("sys:apiParam:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createRequestForm(String paramType,Integer interfaceId,Model model) {
		model.addAttribute("apiParam", new ApiParam());
		model.addAttribute("paramType", paramType);
		model.addAttribute("interfaceId", interfaceId);
		model.addAttribute("action", "create");
		return "system/apiparam/apiParamForm";
	}
	
	@RequiresPermissions("sys:apiParam:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@Valid ApiParam apiParam,Integer interfaceId, Model model) {
		ApiInterface apiInterface=apiInterfaceService.get(interfaceId);
		apiParam.setApiInterface(apiInterface);
		apiParamService.save(apiParam);
		return "success";
	}
	
	@RequiresPermissions("sys:apiParam:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id,Integer interfaceId,String paramType, Model model) {
		ApiParam param=apiParamService.get(id);
		model.addAttribute("apiParam",param );
		model.addAttribute("paramType", paramType);
		model.addAttribute("interfaceId",interfaceId);
		model.addAttribute("action", "update");
		return "system/apiparam/apiParamForm";
	}

	
	@RequiresPermissions("sys:apiParam:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody ApiParam apiParam,Integer interfaceId,Model model) {
		ApiInterface apiInterface=apiInterfaceService.get(interfaceId);
		apiParam.setApiInterface(apiInterface);
		apiParamService.update(apiParam);
		return "success";
	}

	@RequiresPermissions("sys:apiParam:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		apiParamService.delete(id);
		return "success";
	}

	
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getApiParam(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("apiParam", apiParamService.get(id));
		}
	}

}
