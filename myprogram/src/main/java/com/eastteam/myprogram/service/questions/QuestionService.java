package com.eastteam.myprogram.service.questions;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.QuestionMybatisDao;
import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.service.PageableService;
import com.eastteam.myprogram.service.product.ProductService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class QuestionService extends PageableService {
	@Autowired
	private QuestionMybatisDao questionMybatisDao;
	
	private int pageSize;
	
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		logger.info("in service, pagesize = " + pageSize);
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return questionMybatisDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		Map param = Maps.newHashMap(parameters);
		return questionMybatisDao.getCount(param);
	}
	
	public String[] splitQuestionOptions(String options){
		String[] questionOptions = options.split("\\^");
		return questionOptions;
	}
	
	public void saveQuestion(Question question){
		questionMybatisDao.save(question);
	}
}
