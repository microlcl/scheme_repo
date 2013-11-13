package com.eastteam.myprogram.dao;

import com.eastteam.myprogram.entity.Media;


@MyBatisRepository
public interface MediaMybatisDao {
	public void insert(Media media);
}
