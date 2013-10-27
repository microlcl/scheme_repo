package com.eastteam.myprogram.service.category;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.dao.SpringTransactionalTestCase;

public class CategoryServiceTest extends SpringTransactionalTestCase {
	
	@Autowired
	CategoryService categoryService;

	@Test
	public void testGetNextSubId() {
		assertEquals("1-1-3", this.categoryService.getNextSubId("1-1"));
		assertEquals("2-1", this.categoryService.getNextSubId("2"));
		
	}

}
