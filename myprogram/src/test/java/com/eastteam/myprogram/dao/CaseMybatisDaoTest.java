package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;

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
}
