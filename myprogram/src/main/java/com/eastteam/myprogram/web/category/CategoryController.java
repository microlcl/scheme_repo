package com.eastteam.myprogram.web.category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "category/list";
	}
}
