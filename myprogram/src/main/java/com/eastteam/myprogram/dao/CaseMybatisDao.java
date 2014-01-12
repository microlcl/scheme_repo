package com.eastteam.myprogram.dao;

import com.eastteam.myprogram.entity.Case;

@MyBatisRepository
public interface CaseMybatisDao {
	
	public Case get(Long CaseId);

}
