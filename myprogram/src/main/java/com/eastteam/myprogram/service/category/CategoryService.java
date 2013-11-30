package com.eastteam.myprogram.service.category;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.CategoryMybatisDao;
import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.CategoryLiteBean;
import com.google.common.collect.Lists;

@Component
@Transactional
public class CategoryService {
	
	private static Logger logger = LoggerFactory.getLogger(CategoryService.class);
	
	@Autowired
	private CategoryMybatisDao categoryDao;
	
	public List<Category> search() {
		return categoryDao.search();
	}
	
	public void save(Category category) {
		String id = category.getId();
		if (isExist(id)) {
			this.categoryDao.update(category);
			logger.info("update category with id= {} finished.", id);
		} else {
			this.categoryDao.insert(category);
			logger.info("insert category with id= {} finished.", id);
		}
	} 
	
	public String getNextSubId(String pid) {
		String maxSubId = this.categoryDao.getMaxSubId(pid);
		if (StringUtils.isBlank(maxSubId)) {
			return pid + "-1";
		}
		String seq = StringUtils.substringAfterLast(maxSubId, "-");
		int nexID = Integer.parseInt(seq) + 1;		
		return pid + "-" + nexID;
	}
	
	private boolean isExist(String id) {
		return this.categoryDao.getCount(id) > 0;
	}
	
	public void delete(String id) {
		this.categoryDao.delete(id);
	} 
	
	/**
	 * 提供给Comobotree使用，根据moduleId动态产生分类下拉菜单
	 * @param moduleId
	 * @return
	 */
	public List<CategoryLiteBean> getModuleCategorys(String moduleId) {
		
		List<CategoryLiteBean> moduleCategorys = categoryDao.getModuleCategorys(moduleId);
		List<CategoryLiteBean> categoryList = Lists.newArrayList();
		for(CategoryLiteBean moduleCategory : moduleCategorys) {
			CategoryLiteBean category = categoryDao.getAll(moduleCategory.getId());
			categoryList.add(category);
		}
		return categoryList;
	}
}
