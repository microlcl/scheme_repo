package com.eastteam.myprogram.web.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.service.category.CategoryService;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "category/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, List> search() {
		Map<String, List> map = new HashMap<String, List>();
		map.put("rows", categoryService.search());
		return map;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/api/create",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> create(@RequestBody Category category) {

		System.out.println("in create:" + category);

		return new ResponseEntity(HttpStatus.CREATED);
	}
}
