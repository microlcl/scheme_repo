package com.eastteam.myprogram.web.role;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/role")
public class RoleController {
	
	private static Logger logger = LoggerFactory.getLogger(RoleController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String role() {
		logger.info("in role controller");
		return "role/list";
	}

}
