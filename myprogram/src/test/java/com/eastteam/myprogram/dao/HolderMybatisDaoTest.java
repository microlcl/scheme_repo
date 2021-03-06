package com.eastteam.myprogram.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Spaces;
import com.google.common.collect.Maps;

public class HolderMybatisDaoTest extends SpringTransactionalTestCase {

	@Autowired
	private HolderMybatisDao holderDao;
	
	@Test
	public void searchTest() throws Exception{
		Map<String, Object> parameter = Maps.newHashMap();
		List<Spaces> spaces = holderDao.search(parameter);
		assertEquals(1, spaces.size());
	}
	@Test
	public void saveTest() throws Exception{
		Spaces space= new Spaces();
		space.setDescription("description");
		space.setFloor(1);
		space.setHall_height(1);
		space.setSpace_name("1");
		Holders holders= new Holders();
		holders.setId(1l);
		space.setHolders(holders);
		holderDao.saveSpace(space);
		Map<String, Object> parameter = Maps.newHashMap();
		List<Spaces> spaces = holderDao.search(parameter);
		assertEquals(2,spaces.size());
	}
	@Test
	public void updateTest() throws Exception{
		Map<String, Object> parameter = Maps.newHashMap();
		List<Spaces> spaces = holderDao.search(parameter);
		assertNotNull("allRole not null", spaces);
	}
}
