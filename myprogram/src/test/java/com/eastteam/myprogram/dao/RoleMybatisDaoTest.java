package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Role;

public class RoleMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(UserMybatisDaoTest.class);

	@Autowired
	private RoleMybatisDao roleDao;
	
	@Test
	public void getAllRole() throws Exception{
		List<Role> allRole = roleDao.selectAll();
		logger.info(allRole.toString());
		assertNotNull("allRole not null", allRole);
	}
}
