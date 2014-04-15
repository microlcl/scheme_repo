package com.eastteam.myprogram.service.procedure;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.ProcedureMybatisDao;
import com.eastteam.myprogram.entity.Procedure;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class ProcedureService extends PageableService {
	
	private static Logger logger = LoggerFactory.getLogger(ProcedureService.class);
	
	@Autowired
	private ProcedureMybatisDao procedureDao;

	@Override
	public List search(Map parameters, Pageable pageRequest) {
		// TODO Auto-generated method stub
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		
		return procedureDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		return procedureDao.getCount(parameters);
	}
	
	public void saveProcedure(Procedure procedure) {
		logger.info("in procedure save service");
		this.procedureDao.insertProcedure(procedure);
	}
	
	public void updateProcedure(Procedure procedure) {
		logger.info("in procedure update service");
		this.procedureDao.updateProcedure(procedure);
	}
	
	public Procedure selectProcedure(String paperId) {
		logger.info("in procedurer select procedure service");
		return(this.procedureDao.selectProcedure(Long.parseLong(paperId)));
		
	}
	
	public void deleteProcedure(String paperId) {
		logger.info("in procedure save service");
		this.procedureDao.deleteProcedure(Long.parseLong(paperId));
	}

}
