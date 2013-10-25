package com.eastteam.myprogram.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.CategoryMybatisDao;
import com.eastteam.myprogram.entity.Category;

@Component
@Transactional
public class CategoryService {
	
	@Autowired
	private CategoryMybatisDao categoryDao;
	
	public List<Category> search() {
		return categoryDao.search();
	}
}
