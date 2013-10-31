package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.User;
import com.google.common.collect.Maps;


public class UserMybatisDaoTest extends SpringTransactionalTestCase {
	
	private static Logger logger = LoggerFactory.getLogger(UserMybatisDaoTest.class);

	@Autowired
	private UserMybatisDao userDao;

//	@Test
//	public void getUser() throws Exception {
//		User user = userDao.get(1L);
//		assertNotNull("User not found", user);
//		assertEquals("admin", user.getLoginName());
//	}
//
	@Test
	public void searchUser() throws Exception {
//		Map<String, Object> parameter = Maps.newHashMap();
//		parameter.put("name", "admin");
//		List<User> result = userDao.search(parameter);
//		logger.info("result1=" + result);
//		assertEquals(1, result.size());
//		assertEquals("admin", result.get(0).getName());
//		
//		List<User> result2 = userDao.search(null);
//		logger.info("result2=" + result2);
//		assertEquals(3, result2.size());
		
		Map<String, Object> parameter3 = Maps.newHashMap();
		parameter3.put("email", "microlclgmail.com");
		parameter3.put("id", "microlcl");
		List<User> result3 = userDao.search(parameter3);
		logger.info("result1=" + result3);
		assertEquals(1, result3.size());
		
	}
	
	@Test
	public void saveUser()  throws Exception {
		logger.info("hello");
		User user = new User();
		user.setId("lichunlei");
		user.setName("Cheney");
		user.setPassword("1111111");
		userDao.save(user);		
	}
}
