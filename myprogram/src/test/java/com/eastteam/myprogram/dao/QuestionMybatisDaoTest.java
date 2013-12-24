package com.eastteam.myprogram.dao;


import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Question;

public class QuestionMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(QuestionMybatisDao.class);
	
	@Autowired
	private QuestionMybatisDao questionDao;
	
	@Test
	public void saveQuestionTest() throws Exception {
		logger.info("Question save");
		
		Question question = new Question();
		question.setQuestion("sdfsfdsfd");
		question.setQuestionType("1");
		question.setQuestionOptions("aaa,bbb,ccc");
		
		questionDao.save(question);
		
		Question question1 = new Question();
		question1.setQuestion("sdfsfdsfd");
		question1.setQuestionType("1");
		question1.setQuestionOptions("aaa,bbb,ccc");
		
		questionDao.save(question1);
	}
	
	@Test
	public void updateQuestionTest() throws Exception {
		logger.info("Qestion update");
		
		Question question = new Question();
		question.setId(1l);
		question.setQuestion("sdfsfdsfd");
		question.setQuestionType("1");
		question.setQuestionOptions("aaa,bbb,ccc");
		
		questionDao.update(question);
	}
	
	@Test
	public void deleteQuestionTest() throws Exception {
		logger.info("Qestion delete");
		
		Question question = new Question();
		question.setId(1l);
		
		questionDao.delete(question);
	}
	
	@Test
	public void getQuestionTest() throws Exception {
		logger.info("Qestion update");
		
		questionDao.getQuestion();
	}
}
