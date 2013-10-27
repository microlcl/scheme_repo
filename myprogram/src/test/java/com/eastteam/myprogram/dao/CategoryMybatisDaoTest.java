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
		assertTrue(categorys.size() > 0);
	}
	
	@Test
	public void save() {
		int size = categoryDao.search().size();
		Category category = new Category();
		category.setId("1-2");
		category.setPid("1");
		category.setName("道具");
		category.setTrashed("F");
		category.setComment("我的备注");
		this.categoryDao.save(category);
		assertEquals(1, categoryDao.search().size() - size);
	}

}
