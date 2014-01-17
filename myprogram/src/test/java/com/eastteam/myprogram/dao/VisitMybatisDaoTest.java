/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.VisitActivity;

/**
 * @author LSS
 *
 */
public class VisitMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(VisitMybatisDaoTest.class);
	
	@Autowired
	private VisitMybatisDao visitMybatisDao;
	
	@Test
	public void SearchTest(){
		logger.info("in visit activity search test");
		List<VisitActivity> result = visitMybatisDao.search(null);
		logger.info("result=" + result);
	}
	
	@Test
	public void getCountTest(){
		logger.info("in visit activity get count test");
		logger.info("Count:" + visitMybatisDao.getCount(null));
	}
	
	@Test
	public void insertCustomerTest() {
		logger.info("in visit actvity insert customer test");
		logger.info("增加客户之前的列表" + visitMybatisDao.selectCustomers());
		Customer customer = new Customer();
		customer.setCustomerName("李某某");
		visitMybatisDao.insertCustomer(customer);
		logger.info("New Customer id:" + customer.getId());
		logger.info("增加客户之后的列表" + visitMybatisDao.selectCustomers());
	}
}
