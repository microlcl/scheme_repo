/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Paper;

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
	
	@Test
	public void SearchCountTest(){
		logger.info("in Paper search count test");
		
		Long count = paperMybatisDao.getCount(null);
		logger.info("count=" + count);
	}

}
