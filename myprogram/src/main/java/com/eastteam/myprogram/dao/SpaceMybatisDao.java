package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Spaces;

@MyBatisRepository
public interface SpaceMybatisDao {
	void save(Spaces space);
	List<Spaces> search(Map<String, Object> parameters);
	Long getCount(Map<String, Object> parameters);
	void update(Spaces space);
	Spaces getSpaces(long id);
}
