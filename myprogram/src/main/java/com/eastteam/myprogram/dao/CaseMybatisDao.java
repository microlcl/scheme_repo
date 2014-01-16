package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;


@MyBatisRepository
public interface CaseMybatisDao {
	List<Case> search(Map<String, Object> parameters);
	Long getCount(Map<String, Object> parameters);
	public Case get(Long CaseId);
	public List<Answer> getAnswers(Long CaseId);

}
