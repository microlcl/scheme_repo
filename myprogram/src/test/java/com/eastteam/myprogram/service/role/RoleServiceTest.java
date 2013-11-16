package com.eastteam.myprogram.service.role;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.eastteam.myprogram.dao.SpringTransactionalTestCase;

public class RoleServiceTest extends SpringTransactionalTestCase {
	@Autowired
	RoleService roleService;

	@Test
	public void testGetNextSubId() {
	}
}
