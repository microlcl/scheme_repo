package com.eastteam.myprogram.web.account;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Role;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.account.AccountService;
import com.eastteam.myprogram.service.role.RoleService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	private static final int PAGE_SIZE = 5;
	
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("id", "登录名");
		sortTypes.put("name", "姓名");
		sortTypes.put("email", "邮件");
	}
	
	private static Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value="register",method = RequestMethod.GET)
	public String registerForm() {
		return "account/register";
	}
	
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String register(@Valid User user, RedirectAttributes redirectAttributes) {
		logger.info("user=" + user);
		accountService.registerUser(user);
		redirectAttributes.addFlashAttribute("username", user.getId());
		return "redirect:/login";
	}
	
	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("loginName") String loginName) {
		if (accountService.findUserByLoginName(loginName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
		Page<User> users = accountService.getCurrentPageContent(searchParams, pageNumber, PAGE_SIZE, sortType);
		model.addAttribute("users", users);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "account/list";
	}
	
	@RequestMapping(value = "show/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String id, Model model) {
		model.addAttribute("user", this.accountService.getUser(id));
		model.addAttribute("allRoles", this.getAllRolesList(this.accountService.getUser(id)));
		return "account/userForm";
	}
	
	@RequestMapping(value = "show", method = RequestMethod.POST)
	public String update(@ModelAttribute("user") User user, @RequestParam(value="role")List selectedRoles, RedirectAttributes redirectAttributes) {
		logger.info("in update action");
//		String[] selectedRoles = request.getParameterValues("role");
		this.accountService.updateUserInfo(user);
		this.accountService.deleteUserRole(user);
		this.accountService.updateUserRole(user.getId(), selectedRoles);
		
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/account/list/";
	}
	
	private List<RoleBean> getAllRolesList(User user) {
		List<Role> assignedRoles = user.getRoles();		
		List<Role> allRoles = roleService.getAllRoles();
		RoleBean roleBean = new RoleBean();
		List<RoleBean> roleList = roleBean.roleList(allRoles);		

		for(int i=0; i<assignedRoles.size(); i++){
			String assignedRolesid = assignedRoles.get(i).getId();
			for(int j=0; j<roleList.size(); j++){				
				String roleListid = roleList.get(j).getId();
				if(assignedRolesid.equals(roleListid))
					roleList.get(j).setChecked(true);
			}
		}
		return roleList;
	}

}
