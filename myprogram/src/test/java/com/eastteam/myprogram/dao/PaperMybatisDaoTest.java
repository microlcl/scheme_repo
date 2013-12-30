/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.Question;
import com.google.common.collect.Maps;

/**
 * @author LSS
 *
 */
public class PaperMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(PaperMybatisDaoTest.class);
	
	@Autowired
	private PaperMybatisDao paperMybatisDao;
	
	@Test
	public void SearchPaperTest(){
		logger.info("in Paper search test");
		List<Paper> result = paperMybatisDao.search(null);
		logger.info("result=" + result);
	}
	
//	@Test
//	public void selectStatusTest() throws Exception{
//		logger.info("in Paper select status test");
//		String status = "1-0-1-1";
//		Category result = paperMybatisDao.selectStatus(status);
//		logger.info("result=" + result);
//	}
//	
//	@Test
//	public void selectBusiness_typeTest() throws Exception{
//		logger.info("in Paper select business type test");
//		String business_type = "1-0-2-0";
//		Category result = paperMybatisDao.selectBusiness_type(business_type);
//		logger.info("result=" + result);
//	}
//	
	@Test
	public void getCountTest() throws Exception {
		logger.info("In Paper get count test");
		
		Long count = paperMybatisDao.getCount(null);
		logger.info("count=" + count);
	}
	
	@Test
	public void getQuestionsTest() throws Exception {
		logger.info("In Page get questions test");
		String paper_id = "1";
		List<Question> questions = this.paperMybatisDao.selectQuestions(paper_id);
		logger.info("=====Test Questions: " + questions);
	}
}
