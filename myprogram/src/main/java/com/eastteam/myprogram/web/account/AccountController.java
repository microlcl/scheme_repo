package com.eastteam.myprogram.web.account;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
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
	public String register(@Valid User user, @RequestParam(value="userBirthday") String birthday, RedirectAttributes redirectAttributes) {
		logger.info("user=" + user);
		user.setBirthday(birthday);
		accountService.registerUser(user);
		redirectAttributes.addFlashAttribute("username", user.getId());
		return "redirect:/login";
	}
	
	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value="checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("id") String loginName) {
		logger.info("检查用户名是否已被注册");
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
		Page<User> users = accountService.getCurrentPageContent(searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		model.addAttribute("users", users);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "account/list";
	}
	
	@RequestMapping(value = "show/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String id, Model model) {
		User user =  this.accountService.getUser(id);

		model.addAttribute("formUser", user);
		model.addAttribute("allRoles", this.getAllRolesList(user));
		return "account/userForm";
	}
	
	@RequestMapping(value = "show/userInfo/{id}", method = RequestMethod.GET)
	public String dispalyUserInfo(@PathVariable("id") String id, Model model) {
		User user =  this.accountService.getUser(id);

		model.addAttribute("infoUser", user);
		model.addAttribute("allRoles", this.getAllRolesList(user));
		return "account/userInfo";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String adminUpdate(@ModelAttribute("user") User user, @RequestParam(value="userBirthday") String birthday,  @RequestParam(value="role") List selectedRoles, RedirectAttributes redirectAttributes) {
		logger.info("in update action");
		logger.info(selectedRoles.toString());
//		String[] selectedRoles = request.getParameterValues("role");
		user.setBirthday(birthday);

		this.accountService.updateUserInfo(user);
		this.accountService.deleteUserRole(user);
		this.accountService.updateUserRole(user.getId(), selectedRoles);
		
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/account/list/";
	}
	
	@RequestMapping(value = "edit/profile/{id}", method = RequestMethod.GET)
	public String editProfile(@PathVariable("id") String id, Model model) {
		User user =  this.accountService.getUser(id);

		model.addAttribute("updateUser", user);
		model.addAttribute("allRoles", this.getAllRolesList(user));
		return "account/updateUserInfo";
	}
	
	@RequestMapping(value = "save/profile", method = RequestMethod.POST)
	public String updatePersonalInfo(@ModelAttribute("user") User user, @RequestParam(value="userBirthday") String birthday, RedirectAttributes redirectAttributes) {
		logger.info("in update action");
		user.setBirthday(birthday);

		this.accountService.updateUserPersonalInfo(user);
		
		redirectAttributes.addFlashAttribute("message", "个人信息修改成功！");
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
