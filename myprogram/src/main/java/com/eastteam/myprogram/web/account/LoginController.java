package com.eastteam.myprogram.web.account;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eastteam.myprogram.entity.User;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		System.out.println("in log controller");
		return "account/login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login2(User user, HttpSession session) {
		System.out.println("in log controller2. user " + user);
		session.setAttribute("user", user);
		return "redirect:/index.jsp";
	}
}
