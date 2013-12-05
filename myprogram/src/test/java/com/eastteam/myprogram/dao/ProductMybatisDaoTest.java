package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Product_category;
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
	
	@Test
	public void saveTest() throws Exception{
		Product product=new Product();
		product.setDescription("description111");
		product.setPrice(new BigDecimal(111.11));
		product.setStatus("status111");
		assertNotNull("allRole not null", product);
		productMybatisDao.save(product);
		Map<String, Object> parameter = Maps.newHashMap();
		List<Product> list = productMybatisDao.search(parameter);
		assertEquals(6,list.size());
	}
	
	@Test
	public void saveProduct_categoryidTest() throws Exception{
//		Product product=new Product();
//		product.setDescription("description111");
//		product.setPrice(new BigDecimal(111.11));
//		product.setStatus("status111");
//		assertNotNull("allRole not null", product);
//		productMybatisDao.save(product);
		
		Product_category product_category=new Product_category();
		product_category.setProduct_id(1l);
		product_category.setCategory_id("1-1-2");
		product_category.setPicture_id("1");
		productMybatisDao.saveProduct_category(product_category);
		
		Map<String, Object> parameter = Maps.newHashMap();
		parameter.put("categoryId", "1-1-2");
		List<Product> list = productMybatisDao.search(parameter);
		System.out.println(list.size());
		assertEquals(1, list.size());
	}
	
//	@Test
//	public void saveMediaTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	
//	@Test
//	public void updateTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	
//	@Test
//	public void updateProduct_categoryidTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	
//	@Test
//	public void updateMedia() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	@Test
//	public void deleteTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	
//	@Test
//	public void deleteProduct_categoryidTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	@Test
//	public void deleteMediaTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
//	@Test
//	public void getProductTest() throws Exception{
//		Map<String, Object> parameter = Maps.newHashMap();
//		List<Product> product = productMybatisDao.search(parameter);
//		assertNotNull("allRole not null", product);
//		assertEquals(5, product.size());
//	}
	
}
