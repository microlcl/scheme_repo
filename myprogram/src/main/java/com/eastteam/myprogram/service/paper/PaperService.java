/**
 * 
 */
package com.eastteam.myprogram.service.paper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.PaperMybatisDao;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.Question;
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

	public List<Question> getQuestions(String paper_id){
		return paperMybatisDao.selectQuestions(paper_id);
	}
	
	public String[] splitQuestionOptions(String options){
		String[] questionOptions = options.split("\\^");
		return questionOptions;
	}
	
	public void saveQuestions(Paper paper, String[] questions) {
		logger.info("in paper save service");
		this.paperMybatisDao.insertPaper(paper);
		String paperId = Long.toString(paper.getId());
		for (int i = 0; i < questions.length; i++){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("paperId", paperId);
			map.put("questionId", questions[i]);
			map.put("position", 10);
			this.paperMybatisDao.insertQuestions(map);
		}
	}
	
	public Paper selectPaper(String paperId) {
		logger.info("in paper select paper service");
		return(this.paperMybatisDao.selectPaper(paperId));
		
	}
}
