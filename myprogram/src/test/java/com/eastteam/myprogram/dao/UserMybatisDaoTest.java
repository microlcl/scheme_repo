package com.eastteam.myprogram.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;

import com.eastteam.myprogram.entity.User;

@DirtiesContext
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class UserMybatisDaoTest extends SpringTransactionalTestCase {

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
		System.out.println("hello");
		User user = new User();
		user.setLoginName("lichunlei");
		user.setName("Cheney");
		user.setPassword("1111111");
		userDao.save(user);
		
	}



}
