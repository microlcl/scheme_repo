package com.eastteam.myprogram.dao;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.User;


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
//	@Test
//	public void searchUser() throws Exception {
//		Map<String, Object> parameter = Maps.newHashMap();
//		parameter.put("name", "管理员");
//		List<User> result = userDao.search(parameter);
//		assertEquals(1, result.size());
//		assertEquals("admin", result.get(0).getLoginName());
//	}
	
	@Test
	public void saveUser()  throws Exception {
		logger.info("hello");
		User user = new User();
		user.setLoginName("lichunlei");
		user.setName("Cheney");
		user.setPassword("1111111");
		userDao.save(user);
		
	}



}
