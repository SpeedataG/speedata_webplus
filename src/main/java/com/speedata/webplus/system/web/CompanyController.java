package com.speedata.webplus.system.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.speedata.webplus.system.entity.Company;
import com.speedata.webplus.system.service.CompanyService;

/**
 * 企业信息
 */
@Controller
@RequestMapping("system/company")
public class CompanyController extends BaseController {

	@Autowired
	private CompanyService companyService;

	/**
	 * 默认页面
	 */
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list() {
		return "system/company/list";
	}

	/**
	 * 获取用户json
	 */
	@RequiresPermissions("sys:company:view")
	@RequestMapping(value="search",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Page<Company> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		page = companyService.search(page, filters);
		return getEasyUIData(page);
	}

	
	@RequiresPermissions("sys:Company:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("company", new Company());
		model.addAttribute("action", "create");
		return "system/company/companyForm";
	}

	
	@RequiresPermissions("sys:Company:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@Valid Company Company, Model model) {
		companyService.save(Company);
		return "success";
	}

	
	@RequiresPermissions("sys:Company:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("company", companyService.get(id));
		model.addAttribute("action", "update");
		return "system/company/companyForm";
	}

	
	@RequiresPermissions("sys:Company:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody Company company,Model model) {
		companyService.update(company);
		return "success";
	}

	@RequiresPermissions("sys:Company:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		companyService.delete(id);
		return "success";
	}

	
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getCompany(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("company", companyService.get(id));
		}
	}

}
