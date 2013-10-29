package com.eastteam.myprogram.dao;

import java.util.List;

import com.eastteam.myprogram.entity.Category;

@MyBatisRepository
public interface CategoryMybatisDao {
	public List<Category> search();
	public void insert(Category category);	
	public void update(Category category);
	public int getCount(String id);
	/**
	 * Get the max sub category ID for the input Parent Id
	 * @param ParentId Parent category ID
	 */
	public String getMaxSubId(String pid);
}
