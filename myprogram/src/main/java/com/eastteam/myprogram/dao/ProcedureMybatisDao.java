package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Procedure;


@MyBatisRepository
public interface ProcedureMybatisDao {
	public List<Procedure> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	public void insertProcedure(Procedure procedure);
	public void updateProcedure(Procedure procedure);
	public void deleteProcedure(Long procedureId);
	public Procedure selectProcedure(Long procedureId);
}
