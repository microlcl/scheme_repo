package com.eastteam.myprogram.web.role;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jetty.server.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Function;
import com.eastteam.myprogram.entity.Module;
import com.eastteam.myprogram.entity.Role;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.role.RoleService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;


@Controller
@RequestMapping(value = "/role")
public class RoleController {
	private static final int PAGE_SIZE = 5;
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("name", "角色名");
		sortTypes.put("description", "描述");
	}
	
	@Autowired
	private RoleService roleService;
	
	
	private static Logger logger = LoggerFactory.getLogger(RoleController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String role() {
		logger.info("in role controller");
		return "role/list";
	}

	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "role_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
		Page<Role> roles = roleService.getCurrentPageContent(searchParams, pageNumber, PAGE_SIZE, sortType);
		model.addAttribute("roles", roles);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "role/list";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String id, Model model) {
		model.addAttribute("role", this.roleService.getRole(id));
		List<Module> modules=this.roleService.getAllModule();
		model.addAttribute("moduleList",modules);
		return "role/roleForm";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute Role role,  @RequestParam(value="functionList") List<String[]> functionList, RedirectAttributes redirectAttributes) {
		logger.info("in role update action");
		this.roleService.save(role,functionList);
		redirectAttributes.addFlashAttribute("message", "角色权限更新成功");
		return "redirect:/role/list/";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@ModelAttribute Role role,  RedirectAttributes redirectAttributes) {
		logger.info("delete role action");
		this.roleService.delete(role.getId());
		redirectAttributes.addFlashAttribute("message", "角色删除成功");
		return "redirect:/role/list/";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		List<Module> modules=this.roleService.getAllModule();
		model.addAttribute("moduleList",modules);
		return "role/addRole";
	}
	
	@RequestMapping(value = "doAdd", method = RequestMethod.POST)
	public String doAdd(@ModelAttribute Role role,  @RequestParam(value="functionList") List<String[]> functionList, RedirectAttributes redirectAttributes) {
		logger.info("in role update action");
		this.roleService.save(role,functionList);
		redirectAttributes.addFlashAttribute("message", "角色权限更新成功");
		return "redirect:/role/list/";
	}
}
