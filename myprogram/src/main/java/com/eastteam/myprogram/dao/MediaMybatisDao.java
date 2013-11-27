package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Media;


@MyBatisRepository
public interface MediaMybatisDao {
	public void insert(Media media);
	public void insertCategory(Map<String, Object> parameters);
	public List<Media> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);	
}
