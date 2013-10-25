package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Category;

public class CategoryMybatisDaoTest extends SpringTransactionalTestCase{
	
	@Autowired
	private CategoryMybatisDao categoryDao;

	@Test
	public void search() {
		List<Category> categorys = categoryDao.search();
		System.out.println(categorys);
		assertEquals(4, categorys.size());
	}

}
