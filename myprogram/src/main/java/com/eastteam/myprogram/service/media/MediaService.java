package com.eastteam.myprogram.service.media;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.MediaMybatisDao;
import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class MediaService extends PageableService {
	
	@Autowired
	private MediaMybatisDao medaiDao;
	
	
	public List<Media> search(Map parameters, Pageable pageRequest) {
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return medaiDao.search(param);
	}
	
	public Long getCount(Map parameters) {
		Map param = Maps.newHashMap(parameters);
		return medaiDao.getCount(param);
	}
	
	public void insert(List<Media> mediaList) {
		for (Media media : mediaList) {
			medaiDao.insert(media);
		}
	}	

}
