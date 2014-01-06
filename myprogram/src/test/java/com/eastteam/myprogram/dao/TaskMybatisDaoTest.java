package com.eastteam.myprogram.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.Task;
import com.google.common.collect.Maps;

public class TaskMybatisDaoTest extends SpringTransactionalTestCase{
	
	@Autowired
	private TaskMybatisDao taskDao;
	
	@Test
	public void searchTest() throws Exception{
		Map<String, Object> parameter = Maps.newHashMap();
		List<Task> spaces = taskDao.search(parameter);
		assertEquals(1, spaces.size());
	}
	@Test
	public void saveTest() throws Exception{
		Task task= new Task();
		task.setSummary("test");
		Map<String, Object> parameter = Maps.newHashMap();
		List<Task> tasks = taskDao.search(parameter);
		assertEquals(2,tasks.size());
	}

}
