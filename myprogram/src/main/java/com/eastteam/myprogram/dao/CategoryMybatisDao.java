package com.eastteam.myprogram.dao;

import java.util.List;

import com.eastteam.myprogram.entity.Category;

@MyBatisRepository
public interface CategoryMybatisDao {
	public List<Category> search();

}
