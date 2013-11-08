package com.eastteam.myprogram.dao;

import com.eastteam.myprogram.entity.Department;


/**
 * 
 * @author lichlei
 *
 */
@MyBatisRepository
public interface DepartmentMybatisDao {
	Department getDepartment(String id);
}
