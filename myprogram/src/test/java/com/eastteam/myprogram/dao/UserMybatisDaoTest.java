package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Department;
import com.eastteam.myprogram.entity.User;
import com.google.common.collect.Maps;


public class UserMybatisDaoTest extends SpringTransactionalTestCase {
	
	private static Logger logger = LoggerFactory.getLogger(UserMybatisDaoTest.class);

	@Autowired
	private UserMybatisDao userDao;

	@Test
	public void getUser() throws Exception {
		User user = userDao.getUser("userid1");
		logger.info(user.toString());
		assertNotNull("User not found", user);
		User user2 = userDao.getUser("userid2");
		logger.info(user2.toString());
		assertNotNull(user2);
		User user5 = userDao.getUser("userid5");
		logger.info(user5.toString());
		assertNotNull(user5);
		assertNull(userDao.getUser("userid888"));

	}

	@Test
	public void searchUser() throws Exception {
		Map<String, Object> parameter = Maps.newHashMap();
		parameter.put("name", "admin");
		List<User> result = userDao.search(parameter);
		logger.info("result1=" + result);
		assertEquals(1, result.size());
		assertEquals("admin", result.get(0).getName());
		
		List<User> result2 = userDao.search(null);
		logger.info("result2=" + result2);
		assertEquals(13, result2.size());
		
		Map<String, Object> parameter3 = Maps.newHashMap();
		parameter3.put("email", "userid1@gmail.com");
		parameter3.put("id", "userid1");
		List<User> result3 = userDao.search(parameter3);
		logger.info("result3=" + result3);
		assertEquals(1, result3.size());
		
		Map<String, Object> parameter4 = Maps.newHashMap();
		parameter4.put("offset", "8");
		parameter4.put("pageSize", "5");
		parameter4.put("name", "乔布斯");
		parameter4.put("sort", "id");
		parameter4.put("department_id", "D1");
		List<User> result4 = userDao.search(parameter4);
		logger.info("result4=" + result4);
		assertEquals(4, result4.size());		
		
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
	
	@Test
	public void getCount() throws Exception {
		Map<String, Object> parameter1 = Maps.newHashMap();
		parameter1.put("id", "userid1");
		Long count1 = userDao.getCount(parameter1);
		assertTrue(1L == count1);
		
		Map<String, Object> parameter2 = Maps.newHashMap();
		parameter2.put("name", "乔布斯");
		Long count2 = userDao.getCount(parameter2);
		assertTrue(10L == count2);
		
		assertTrue( userDao.getCount(null) > 12);
		
		Map<String, Object> parameter3 = Maps.newHashMap();
		parameter3.put("department_id", "D1-1");
		Long count3 = userDao.getCount(parameter3);
		System.out.println(count3);
		
		
	}
	
	@Test
	public void updateUser() throws Exception {
		logger.info("update user information");
		User user = new User();
		Department department = new Department();
		user.setId("YDQ");
		user.setName("Devin");
		user.setSex("男");
		user.setAddress("ABC");
		user.setEmail("a@cn.abc");
		user.setDepartment(department);
		user.getDepartment().setId("D1-1");
		user.setBirthday("1980-01-01");
		user.setPhoneNum("123123");
		user.setStatus("sdfsa");
		user.setHometown("asdfas");
		
		userDao.updateUser(user);
		
	}
	
	@Test
	public void deleteUserRole() throws Exception {
		User user = new User();
		user.setId("YDQ");
		
		userDao.deleteUserRole(user);
	}
	
	@Test
	public void updateUserRole() throws Exception {
		List roleList = new ArrayList();
		roleList.add("R2");
		roleList.add("R3");
		
		Map<String, Object> param = new HashMap();
		param.put("userId", "YDQ");
		param.put("roleList", roleList);
		
		userDao.updateUserRole(param);
	}
	
	@Test
	public void updateUserPersonal() throws Exception {
		logger.info("update personal user information");
		User user = new User();
		Department department = new Department();
		user.setId("YDQ");
		user.setName("Devin");
		user.setPassword("asdfsafsafdsdf");
		user.setSex("男");
		user.setAddress("ABC");
		user.setEmail("a@cn.abc");
		user.setBirthday("1980-01-01");
		user.setPhoneNum("123123");
		user.setHometown("asdfas");
		
		userDao.updatePersonalInfo(user);
		
	}
}
