package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;
import com.eastteam.myprogram.entity.Product;

@MyBatisRepository
public interface ProductMybatisDao {
	public List<Product> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
}
