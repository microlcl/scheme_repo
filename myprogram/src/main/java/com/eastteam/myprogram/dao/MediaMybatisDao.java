package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Media;


@MyBatisRepository
public interface MediaMybatisDao {
	public void insert(Media media);
	public void update(Media media);
	public void insertCategory(Map<String, Object> parameters);
	public void deleteMediaCategory(String media_id);
	public List<Media> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	Media getMedia(String media_id);
	Category selectCategory(String media_id);
}
