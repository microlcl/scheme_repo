package com.eastteam.myprogram.dao;

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
	private CaseMybatisDao caseyDao;
	
	@Test
	public void get() {
		Case mycase = caseyDao.get(1L);
		logger.info("spaceid = " + mycase.getSpace().getId());
		logger.info("businessType = " + mycase.getBusinessType().getId());
		logger.info("question = " + mycase.getPaper().getQuestions());
		logger.info(mycase.toString());
	}

	@Test
	public void getAnswer() {
		List<Answer> answers = caseyDao.getAnswers(1L);
		logger.info(answers.toString());

	}
}
