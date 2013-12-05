package com.eastteam.myprogram.dao;

import java.util.List;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.CategoryLiteBean;

@MyBatisRepository
public interface CategoryMybatisDao {
	public List<Category> search();
	public void insert(Category category);	
	public void update(Category category);
	public int getCount(String id);
	public void delete(String id);
	public int getSubNodeCount(String pid);
	/**
	 * Get the max sub category ID for the input Parent Id
	 * @param ParentId Parent category ID
	 */
	public String getMaxSubId(String pid);
	
	public CategoryLiteBean getAll(String id);
	
	public List<CategoryLiteBean> getFirstLevelChildren(String id);
	
	/**
	 * 从module_category table 读取指定module的category信息，用于产生特定于某一模块的category下拉菜单
	 * @param moduleId
	 * @return
	 */
	public List<CategoryLiteBean> getModuleCategorys(String moduleId);
	
}
