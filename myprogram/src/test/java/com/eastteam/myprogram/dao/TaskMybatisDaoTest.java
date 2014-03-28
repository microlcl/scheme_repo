package com.eastteam.myprogram.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Comment;
import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.Task;
import com.eastteam.myprogram.entity.User;
import com.google.common.collect.Maps;

public class TaskMybatisDaoTest extends SpringTransactionalTestCase{
	
	@Autowired
	private TaskMybatisDao taskDao;
	
	@Test
	public void searchTest() throws Exception{
		
	}
	@Test
	public void saveTest() throws Exception{
		
	}

	@Test
	public void saveTaskComment() throws Exception{
		Comment comment =new Comment();
		User user= new User();
		user.setId("admin");
		comment.setUser(user);
		comment.setCreatedTimestamp(new Date());
		comment.setComment("aaaaaa");
		taskDao.saveComments(comment);
		Map<String, Object> parameters=new HashMap<String, Object>();
		parameters.put("comment_id", comment.getId());
		parameters.put("task_id", 3);
		System.out.println(comment.getId());
		taskDao.saveTaskComment(parameters);
		Task task =taskDao.getTask(3);
		long a = taskDao.getAllComment();
		long b = taskDao.getAllTaskComment();
		System.out.println();
	}
}
