package com.eastteam.myprogram.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.entity.Media;

public class MediaMybatisDaoTest extends SpringTransactionalTestCase {
	private static Logger logger = LoggerFactory.getLogger(MediaMybatisDaoTest.class);

	@Autowired
	private MediaMybatisDao mediaDao;
	
	@Test
	public void insert() throws Exception{
		Media media = new Media();
		media.setMediaType("pic");
		media.setPath("c:/media");
		media.setTitle("pic test");
		media.setTrashed("F");
		mediaDao.insert(media);
		
		Media media1 = new Media();
		media1.setMediaType("pic");
		media1.setPath("c:/media");
		media1.setTitle("pic test");
		media1.setTrashed("F");
		mediaDao.insert(media1);
		assertTrue(media1.getId() > 1);
	}
}
