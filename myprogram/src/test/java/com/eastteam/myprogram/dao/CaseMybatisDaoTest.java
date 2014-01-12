package com.eastteam.myprogram.dao;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Case;

public class CaseMybatisDaoTest extends SpringTransactionalTestCase{

	private static Logger logger = LoggerFactory.getLogger(CaseMybatisDaoTest.class);
	
	@Autowired
	private CaseMybatisDao caseyDao;
	
	@Test
	public void get() {
		Case mycase = caseyDao.get(1L);
		logger.info("spaceid = " + mycase.getSpace().getId());
		logger.info(mycase.toString());
	}

}
