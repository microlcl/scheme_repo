package com.eastteam.myprogram.service.account;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.DepartmentMybatisDao;
import com.eastteam.myprogram.entity.Department;

@Component
@Transactional
public class DepartmentService {
	
	@Autowired
	private DepartmentMybatisDao departmentDao;
	
	public List<Department> getRootDepartment() {
		Department department = departmentDao.getDepartment("D1");
		List<Department> list = new ArrayList<Department>();
		list.add(department);
		return list;
	}

}
