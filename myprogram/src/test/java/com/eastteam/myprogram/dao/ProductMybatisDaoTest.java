package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.eastteam.myprogram.entity.Product;
import com.google.common.collect.Maps;

public class ProductMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(ProductMybatisDaoTest.class);

	@Autowired
	private ProductMybatisDao productMybatisDao;
	
	@Test
	public void searchTest() throws Exception{
		Map<String, Object> parameter = Maps.newHashMap();
		List<Product> product = productMybatisDao.search(parameter);
		assertNotNull("allRole not null", product);
		assertEquals(5, product.size());
	}
}
