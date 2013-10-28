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

@Component
@Transactional
public class CategoryService {
	
	private static Logger logger = LoggerFactory.getLogger(CategoryService.class);
	
	@Autowired
	private CategoryMybatisDao categoryDao;
	
	public List<Category> search() {
		return categoryDao.search();
	}
	
	public void insert(Category category) {
		String pid = category.getPid();
		if (StringUtils.isNotBlank(pid)) {
			category.setId(getNextSubId(pid));
		}
		this.categoryDao.insert(category);
	} 
	
	String getNextSubId(String pid) {
		logger.info("log演示：pid={}，演示完毕", pid);
		String maxSubId = this.categoryDao.getMaxSubId(pid);
		if (StringUtils.isBlank(maxSubId)) {
			return pid + "-1";
		}
		String seq = StringUtils.substringAfterLast(maxSubId, "-");
		int nexID = Integer.parseInt(seq) + 1;		
		return pid + "-" + nexID;
	}
}
