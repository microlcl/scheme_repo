package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Category;

public class CategoryMybatisDaoTest extends SpringTransactionalTestCase{
	
	private static Logger logger = LoggerFactory.getLogger(CategoryMybatisDaoTest.class);
	
	@Autowired
	private CategoryMybatisDao categoryDao;

	@Test
	public void search() {
		List<Category> categorys = categoryDao.search();
		logger.info(categorys.toString());
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
		this.categoryDao.insert(category);
		assertEquals(1, categoryDao.search().size() - size);
	}
	
	@Test
	public void getMaxSubId() {
		String maxSubId = this.categoryDao.getMaxSubId("1-1");
		assertTrue("1-1-2".equals(maxSubId));
		String maxSubId2 = this.categoryDao.getMaxSubId("2");
		assertNull(maxSubId2);
	}

}
