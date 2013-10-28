package com.eastteam.myprogram.web.account;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eastteam.myprogram.entity.User;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		logger.info("in log controller");
		return "account/login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login2(User user, HttpSession session) {
		logger.info("in log controller2. user " + user);
		session.setAttribute("user", user);
		return "redirect:/index.jsp";
	}
}
