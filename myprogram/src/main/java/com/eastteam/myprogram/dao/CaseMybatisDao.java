package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Stakeholder;


@MyBatisRepository
public interface CaseMybatisDao {
	List<Case> search(Map<String, Object> parameters);
	Long getCount(Map<String, Object> parameters);
	public Case get(Long CaseId);
	public List<Answer> getAnswers(Long CaseId);
	public void update(Case mycase);
	public void deleteAnswers(Case mycase);
	public void insertAnswers(Map<String, Object> parameters);
	public List<Category> getDefaultCharacters(Category businessType);
	public List<Stakeholder> getStakeholders(Long caseId);
	public void insertCaseCustomers(Map<String, Object> parameters);
	public void updateCaseCustomers(Map<String, Object> parameters);
}
