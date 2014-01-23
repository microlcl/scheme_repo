package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Stakeholder;

public class CaseMybatisDaoTest extends SpringTransactionalTestCase{

	private static Logger logger = LoggerFactory.getLogger(CaseMybatisDaoTest.class);
	
	@Autowired
	private CaseMybatisDao casesDao;
	
	@Test
	public void get() {
		Case mycase = casesDao.get(1L);
		logger.info("spaceid = " + mycase.getSpace().getId());
		logger.info("businessType = " + mycase.getBusinessType().getId());
		logger.info("question = " + mycase.getPaper().getQuestions());
		logger.info(mycase.toString());
	}

	@Test
	public void getAnswer() {
		List<Answer> answers = casesDao.getAnswers(1L);
		logger.info(answers.toString());

	}
	
	@Test
	public void update() {
		String title = "my test for title update";
		Case mycase = casesDao.get(1L);
		mycase.setTitle(title);
		casesDao.update(mycase);
		Case mycase2 = casesDao.get(1L);
		assertTrue(title.equals(mycase2.getTitle()));

	}
	
	@Test
	public void deleteAnswers() {
		Case mycase = casesDao.get(1L);
		this.casesDao.deleteAnswers(mycase);
		List<Answer> answers = casesDao.getAnswers(1L);
		logger.info(answers.toString());
		assertTrue(answers.size() == 0);
	}
	
	@Test
	public void insertAnswers() {
		Case mycase = casesDao.get(1L);
		this.casesDao.deleteAnswers(mycase);
//		List<Question> questions = mycase.getPaper().getQuestions();
//		logger.info(answers.toString());
//		assertTrue(answers.size() == 0);
	}
	
	@Test
	public void getDefaultCharacters() {
		Category businessType = new Category();
		businessType.setId("1-0-2-0");
		List<Category> characters = casesDao.getDefaultCharacters(businessType);
		logger.info(characters.toString());
		assertTrue(characters.size() > 0);

	}
	
	@Test
	public void getStakeholders() {
		List<Stakeholder> stakeholders = this.casesDao.getStakeholders(1L);
		logger.info(stakeholders.toString());
		assertTrue(stakeholders.size() > 0);
	}
}
