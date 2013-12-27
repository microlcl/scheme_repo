/**
 * 
 */
package com.eastteam.myprogram.service.paper;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.PaperMybatisDao;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

/**
 * @author LSS
 *
 */

@Component
@Transactional
public class PaperService extends PageableService {
	@Autowired
	private PaperMybatisDao paperMybatisDao;
	
	private int pageSize;
	
	private static Logger logger = LoggerFactory.getLogger(PaperService.class);
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		logger.info("in service, pagesize = " + pageSize);
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return paperMybatisDao.search(param);
	}
	
	@Override
	public Long getCount(Map parameters) {
		Map param = Maps.newHashMap(parameters);
		return paperMybatisDao.getCount(param);
	}

}
