package com.eastteam.myprogram.web.account;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eastteam.myprogram.entity.Department;
import com.eastteam.myprogram.service.account.DepartmentService;

@Controller
@RequestMapping(value = "/department")
public class DepartmentController {
	
	private static Logger logger = LoggerFactory.getLogger(DepartmentController.class);
	
	@Autowired
	private DepartmentService departmentService;

	
	@RequestMapping(method = RequestMethod.GET, value = "/api/get", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Department> search() {
		
		return departmentService.getRootDepartment();
	}
	
}
