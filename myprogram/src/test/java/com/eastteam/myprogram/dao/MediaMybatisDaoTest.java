package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Media;
import com.google.common.collect.Maps;

public class MediaMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(MediaMybatisDaoTest.class);

	@Autowired
	private MediaMybatisDao mediaDao;
	
	@Test
	public void insert() throws Exception{
		Media media = new Media();
		media.setMediaType("pic");
		media.setPath("c:/media");
		media.setStatus("available");
		media.setUserId("lichlei");
		mediaDao.insert(media);
		
		Media media1 = new Media();
		media1.setMediaType("pic");
		media1.setPath("c:/media");
		media1.setStatus("unavailable");
		mediaDao.insert(media1);
		logger.info("media.id=" + media1.getId());
		assertTrue(media1.getId() > 1);
	}
	
	@Test
	public void searchUser() throws Exception {
		Map<String, Object> parameter = Maps.newHashMap();
		parameter.put("categoryId", "1-1-1");
		List<Media> result = mediaDao.search(parameter);
		logger.info("result1=" + result);
		logger.info("result.size=" + result.size());
		assertTrue(result.size() > 1);
		assertTrue(result.get(0).getPath().indexOf("jpg") > 0);
		
		Map<String, Object> parameter0 = Maps.newHashMap();
		parameter0.put("mediaType", "图片");
		List<Media> result0 = mediaDao.search(parameter0);
		logger.info("result0=" + result);
		logger.info("result0.size=" + result0.size());
		assertTrue(result0.size() > 1);
		assertTrue(result0.get(0).getPath().indexOf("jpg") > 0);		
		
		List<Media> result2 = mediaDao.search(null);
		logger.info("result2=" + result2.size());
		assertTrue(12 < result2.size());		
		
		Map<String, Object> parameter4 = Maps.newHashMap();
		parameter4.put("offset", "3");
		parameter4.put("pageSize", "5");
		parameter4.put("mediaType", "图片");
		parameter4.put("sort", "media_id");
		List<Media> result4 = mediaDao.search(parameter4);
		logger.info("result4=" + result4);
		assertEquals(5, result4.size());		
		
	}
	
	@Test
	public void getCount() throws Exception {	
		Map<String, Object> parameter = Maps.newHashMap();
		parameter.put("categoryId", "1-1-1");
		Long count = mediaDao.getCount(parameter);
		logger.info("count=" + count);
		assertTrue(count > 2);
	}
}
