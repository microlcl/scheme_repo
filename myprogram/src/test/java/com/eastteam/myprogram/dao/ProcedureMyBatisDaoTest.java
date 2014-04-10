package com.eastteam.myprogram.dao;


import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Procedure;

public class ProcedureMyBatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(ProcedureMyBatisDaoTest.class);
	
	@Autowired
	private ProcedureMybatisDao ProcedureDao;
	

	@Test
	public void searchQuestionTest() throws Exception {
		
		List<Procedure> result = ProcedureDao.search(null);
		logger.info("result=" + result);
	}
	


}
