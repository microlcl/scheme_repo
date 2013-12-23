package com.eastteam.myprogram.dao;

import com.eastteam.myprogram.entity.Question;

@MyBatisRepository
public interface QuestionMybatisDao {
	public void save(Question question);
	public void update(Question question);
	public void delete(Question question);
	public Question getQuestion(Long questionId);
}
