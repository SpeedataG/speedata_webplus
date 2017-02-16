package com.speedata.webplus.system.web;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.output.FileWriterWithEncoding;
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
import com.speedata.webplus.system.dto.ApiProjectDto;
import com.speedata.webplus.system.entity.ApiInterface;
import com.speedata.webplus.system.entity.ApiMenu;
import com.speedata.webplus.system.entity.ApiProject;
import com.speedata.webplus.system.service.ApiInterfaceService;
import com.speedata.webplus.system.service.ApiMenuService;
import com.speedata.webplus.system.service.ApiProjectService;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 企业信息
 */
@Controller
@RequestMapping("system/api_project")
public class ApiProjectController extends BaseController {

	@Autowired
	private ApiProjectService apiProjectService;
	@Autowired
	private ApiMenuService apiMenuService;
	@Autowired
	private ApiInterfaceService apiInterfaceService;

	/**
	 * 默认页面
	 */

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list() {
		return "system/apiproject/list";
	}

	/**
	 * 
	 */
	@RequiresPermissions("sys:apiProject:view")
	@RequestMapping(value = "search", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(HttpServletRequest request) {
		Page<ApiProject> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter
				.buildFromHttpRequest(request);
		page = apiProjectService.search(page, filters);
		List<ApiProject> list = page.getResult();
		List<ApiProjectDto> dtolist = new ArrayList<ApiProjectDto>();
		for (ApiProject model : list) {
			ApiProjectDto dto = new ApiProjectDto();
			dto.setCreateTime(model.getCreateTime());
			dto.setUpdateTime(model.getUpdateTime());
			dto.setId(model.getId());
			dto.setProjectName(model.getProjectName());
			dto.setRemark(model.getRemark());
			dtolist.add(dto);
		}
		Page<ApiProjectDto> page_new = new Page<ApiProjectDto>(
				page.getPageNo(), page.getPageSize(), page.getOrderBy(),
				page.getOrder());
		page_new.setResult(dtolist);
		page_new.setTotalCount(page.getTotalCount());
		return getEasyUIData(page_new);
	}

	/**
	 * 
	 */
	@RequiresPermissions("sys:apiProject:view")
	@RequestMapping(value = "combo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getcombo(HttpServletRequest request) {
		Page<ApiProject> page = getPage(request);
		List<PropertyFilter> filters = PropertyFilter
				.buildFromHttpRequest(request);
		page = apiProjectService.search(page, filters);
		List<ApiProject> list = page.getResult();
		List<ApiProjectDto> dtolist = new ArrayList<ApiProjectDto>();
		for (ApiProject model : list) {
			ApiProjectDto dto = new ApiProjectDto();
			dto.setCreateTime(model.getCreateTime());
			dto.setUpdateTime(model.getUpdateTime());
			dto.setId(model.getId());
			dto.setProjectName(model.getProjectName());
			dto.setRemark(model.getRemark());
			dtolist.add(dto);
		}
		Page<ApiProjectDto> page_new = new Page<ApiProjectDto>(
				page.getPageNo(), page.getPageSize(), page.getOrderBy(),
				page.getOrder());
		page_new.setResult(dtolist);
		page_new.setTotalCount(page.getTotalCount());
		return getEasyUIData(page_new);

	}

	@RequiresPermissions("sys:apiProject:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("apiProject", new ApiProject());
		model.addAttribute("action", "create");
		return "system/apiproject/apiProjectForm";
	}

	@RequiresPermissions("sys:apiProject:add")
	@RequestMapping(value = "create", method = RequestMethod.POST)
	@ResponseBody
	public String create(@Valid ApiProject apiProject, Model model) {
		apiProject.setCreateTime(new Timestamp(System.currentTimeMillis()));
		apiProjectService.save(apiProject);
		return "success";
	}

	@RequiresPermissions("sys:apiProject:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("apiProject", apiProjectService.get(id));
		model.addAttribute("action", "update");
		return "system/apiproject/apiProjectForm";
	}

	@RequiresPermissions("sys:apiProject:update")
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public String update(
			@Valid @ModelAttribute @RequestBody ApiProject apiProject,
			Model model) {
		apiProject.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		apiProjectService.update(apiProject);
		return "success";
	}

	@RequiresPermissions("sys:apiProject:delete")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		apiProjectService.delete(id);
		return "success";
	}

	@RequiresPermissions("sys:apiProject:genApi")
	@RequestMapping(value = "genApi/{id}")
	@ResponseBody
	public String genApi(@PathVariable("id") Integer id,HttpServletRequest request) {
		// 将页面中要展示的数据放入一个map中
		HashMap<String, Object> map = new HashMap<String, Object>();
		ApiProject project = apiProjectService.get(id);
		// List<ApiInterface>interfacelist=apiInterfaceService.getlist(id);

		List<ApiMenu> menu_list = apiMenuService.getlist(0);
		for (ApiMenu menu : menu_list) {
			List<ApiMenu> child_list = apiMenuService.getlist(menu.getId());
			menu.setChildlist(child_list);
		}
		map.put("menuList",menu_list);
		map.put("project", project);
		try {
			createHtml(map,request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	public void createHtml(HashMap<String, Object> map,HttpServletRequest request) throws IOException,
			TemplateException {

		String ftlPath = request.getSession().getServletContext()
				.getRealPath("/template");// E:\Tomcat\webapps\TEST
		Configuration configuration = new Configuration();
		configuration.setDirectoryForTemplateLoading(new File(ftlPath));
		configuration.setDefaultEncoding("UTF-8");
		Template template = configuration.getTemplate("api_template.ftl");//ftl 获取或创建一个模版。
		String indexPath = request.getSession().getServletContext()
				.getRealPath("/static/plugins/layui-master/api_template.html");// 获取html静态页面文件
		// 设置文件输入流编码，不然生成的html文件会中文乱码
		FileWriterWithEncoding out = new FileWriterWithEncoding(indexPath,
				"UTF-8");
		// 将map中的数据输入到index.ftl这个模板文件中并遍历出来，最后再将整个模板的数据写入到index.html中。
		template.process(map, out);
		out.close();
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getApiProject(
			@RequestParam(value = "id", defaultValue = "-1") Integer id,
			Model model) {
		if (id != -1) {
			model.addAttribute("apiProject", apiProjectService.get(id));
		}
	}

}
