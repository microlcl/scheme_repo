package com.eastteam.myprogram.web.account;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.account.AccountService;
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

}
