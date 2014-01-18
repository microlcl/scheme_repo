package com.eastteam.myprogram.service.cases;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.dao.SpringTransactionalTestCase;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.VisitActivity;

public class CaseServiceTest extends SpringTransactionalTestCase {
	
	private static Logger logger = LoggerFactory.getLogger(CaseServiceTest.class);
	
	@Autowired
	CaseService caseService;

	@Test
	public void get() {
		Case myCase = caseService.get(1L);
		logger.info(myCase.toString());
		List<VisitActivity> activities = myCase.getVisitActivities();
		logger.info(activities.toString());
		assertTrue(!activities.isEmpty());
		
	}

}
