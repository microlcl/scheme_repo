package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Task;




/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 */
@MyBatisRepository
public interface TaskMybatisDao {
	void save(Task task);
	void updateUser(Task task);
	List<Task> search(Map<String, Object> parameters);
	Long getCount(Map<String, Object> parameters);
	Task getTask(String id);
}