package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Role;
import com.eastteam.myprogram.entity.RoleFunction;

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
	
	@Test
	public void testUpdate() throws Exception{
		Role role=new Role();
		role.setId("R1");
		role.setName("管理员2");
		role.setDescription("超级用户1");
		roleDao.update(role);
		Role role2=roleDao.getRole(role.getId());
		assertEquals(role.getName(),role2.getName() );
	}
	
	@Test
	public void testdelete() throws Exception{
		roleDao.deleteRole_Function("R1");
		assertEquals(0,roleDao.getRole("R1").getFunctions().size());
	}
	
	@Test
	public void testSaveRole_Function() throws Exception{
		RoleFunction roleFunction=new RoleFunction();
		roleFunction.setRole_id("R1");
		roleFunction.setFunction_id("F7");
		roleDao.saveRole_Function(roleFunction);
//		roleDao.deleteRole_Function("R1");
//		assertEquals(4,roleDao.getRole("R1").getFunctions().size());
	}
}
