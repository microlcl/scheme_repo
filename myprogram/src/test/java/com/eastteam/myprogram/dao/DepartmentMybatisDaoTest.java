package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Department;

public class DepartmentMybatisDaoTest extends SpringTransactionalTestCase {
	
	private static Logger logger = LoggerFactory.getLogger(DepartmentMybatisDaoTest.class);
	
	@Autowired
	DepartmentMybatisDao departmentDao;
	
	@Test
	public void getDepartment() throws Exception {
		Department department = departmentDao.getDepartment("D1");
		logger.info(department.toString());
		Department son = department.getChildren().get(1).getChildren().get(0);
		assertNotNull(son);
		logger.info(son.toString());
		assertTrue("渠道销售部".equals(son.getName()));
	}

}
