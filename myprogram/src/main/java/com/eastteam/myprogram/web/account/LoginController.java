package com.eastteam.myprogram.web.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.account.AccountService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	AccountService accountService;

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		logger.info("in log controller");
		return "account/login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(User loginuser, HttpSession session, RedirectAttributes redirectAttributes) {
		logger.info("in log controller. user " + loginuser.getId() + ",password=" + loginuser.getPassword());
		User u = accountService.getUser(loginuser.getId());
		if (u == null) {
			logger.info("set mesage1");
			
			redirectAttributes.addFlashAttribute("message", "没有此用户。");
			return "redirect:/login";
		}
		logger.info(u.toString());
		logger.info("u.password=" + u.getPassword());
		//为了便于测试，密码暂时用明码
		if (!u.getPassword().equals(loginuser.getPassword())){
			logger.info("set mesage2");
			redirectAttributes.addFlashAttribute("message", "密码错误。");
			return "redirect:/login";
		}
		logger.info("set user in session");
		List<String> authorizedUriList = accountService.getAuthorizedUriList(u);
		System.out.println(authorizedUriList);
		u.setAuthorizedUriList(authorizedUriList);
		session.setAttribute("user", u);
		return "redirect:/index.jsp";
	}
}
