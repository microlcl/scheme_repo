package com.eastteam.myprogram.dao;

import com.eastteam.myprogram.entity.Customer;


@MyBatisRepository
public interface CustomerMybatisDao {
	public void update(Customer customer);

	public void insert(Customer customer);
}
