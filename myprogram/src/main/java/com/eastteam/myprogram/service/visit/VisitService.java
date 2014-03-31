/**
 * 
 */
package com.eastteam.myprogram.service.visit;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.VisitMybatisDao;
import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.entity.Option;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.entity.VisitActivity;
import com.eastteam.myprogram.service.PageableService;
import com.eastteam.myprogram.web.visit.VisitFormBean;
import com.google.common.collect.Maps;

/**
 * @author LSS
 *
 */

@Component
@Transactional
public class VisitService extends PageableService {
	
	@Autowired
	private VisitMybatisDao visitMybatisDao;
	
	private static Logger logger = LoggerFactory.getLogger(VisitService.class);
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		logger.info("in visit activity service : search ");
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		List<VisitActivity> visitList = visitMybatisDao.search(param);
		
		return visitList;
	}
	
	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		Map param = Maps.newHashMap(parameters);
		return visitMybatisDao.getCount(param);
	}
	
	public void saveVisit(VisitFormBean visitFormBean) {
		logger.info("in visit activity service : save visit");
		if (visitFormBean.getVisitId() != null){
			logger.info("修改现有访问记录");
			Customer customer = visitFormBean.getCustomer();
			if(customer != null){
				customer.setId(visitFormBean.getCustomerId());
				visitMybatisDao.updateCustomer(customer);
			}
			
			Case thisCase = new Case();
			thisCase.setBusinessType(visitFormBean.getBusinessType());
			thisCase.setEventTime(visitFormBean.getEventTime());
			thisCase.setGuestNum(visitFormBean.getGuestNum());
			thisCase.setSpaceTip(visitFormBean.getSpaceTip());
			thisCase.setTitle(visitFormBean.getCaseTitle());
			thisCase.setId(visitFormBean.getCaseId());
			visitMybatisDao.updateCase(thisCase);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("visitType", visitFormBean.getVisitType().getId());
			map.put("visitNum", visitFormBean.getVisitNum());
			map.put("visitTime", visitFormBean.getVisitTime());
			map.put("businessType", visitFormBean.getBusinessType().getId());
			map.put("isVisited", visitFormBean.getIsVisited());
			map.put("comment", visitFormBean.getComment());
			map.put("visitId", visitFormBean.getVisitId());
			visitMybatisDao.updateVisit(map);
		}else if(visitFormBean.getCaseId() != null) {
			Customer customer = visitFormBean.getCustomer();
			visitMybatisDao.insertCustomer(customer);
			
			Case thisCase = new Case();
			thisCase = visitMybatisDao.selectCase(visitFormBean.getCaseId());
	
			HashMap<String, Object> map = new HashMap<String, Object>();
			logger.info("Case Id:" + thisCase.getId() + " Customer Id" + customer.getId());
			map.put("customerId", customer.getId());
			map.put("visitType", visitFormBean.getVisitType().getId());
			map.put("visitNum", visitFormBean.getVisitNum());
			map.put("visitTime", visitFormBean.getVisitTime());
			map.put("businessType", visitFormBean.getBusinessType().getId());
			map.put("caseId", thisCase.getId());
			map.put("isVisited", visitFormBean.getIsVisited());
			map.put("comment", visitFormBean.getComment());
			Paper paper = visitFormBean.getPaper();
			if (paper != null) {
				map.put("paperId", paper.getId());
			}
			map.put("operator",visitFormBean.getOperator().getId());
			visitMybatisDao.insertVisit(map);
		}
		else{
			
			Customer customer = visitFormBean.getCustomer();
			logger.info("***********In Visit Service: customer = " + customer);
			visitMybatisDao.insertCustomer(customer);
			
			Case thisCase = new Case();
			thisCase.setBusinessType(visitFormBean.getBusinessType());
			thisCase.setEventTime(visitFormBean.getEventTime());
			thisCase.setGuestNum(visitFormBean.getGuestNum());
			thisCase.setSpaceTip(visitFormBean.getSpaceTip());
			thisCase.setTitle(visitFormBean.getCaseTitle());
			visitMybatisDao.insertCase(thisCase);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			logger.info("Case Id:" + thisCase.getId() + " Customer Id" + customer.getId());
			map.put("customerId", customer.getId());
			map.put("visitType", visitFormBean.getVisitType().getId());
			map.put("visitNum", visitFormBean.getVisitNum());
			map.put("visitTime", visitFormBean.getVisitTime());
			map.put("businessType", visitFormBean.getBusinessType().getId());
			map.put("caseId", thisCase.getId());
			map.put("isVisited", visitFormBean.getIsVisited());
			map.put("comment", visitFormBean.getComment());
			visitMybatisDao.insertVisit(map);
		}
	}
	
	public VisitActivity getVisitWithAnswer(String visitId){
		VisitActivity visit = this.visitMybatisDao.selectVisit(Long.parseLong(visitId));
		if (visit.getPaper() != null) {
			List<Answer> answerList = this.visitMybatisDao.getAnswers(visitId);
			visit = buildVisitWithAnswers(visit, answerList);
		}
		
		return visit;
	}
	
	private VisitActivity buildVisitWithAnswers(VisitActivity visit, List<Answer> answerList) {
		// TODO Auto-generated method stub
		List<Question> questionList = visit.getPaper().getQuestions();
		if (questionList == null || questionList.isEmpty() || answerList == null || answerList.isEmpty()) {
			return visit;
		}
		for (Question question : questionList) {
			Option[] options = question.getOptions();
			//问答题
			if (question.getQuestionType().equals(Question.OPEN_QUESTION)) {
				setOpenAnswer(question, answerList);
				continue;
			}
			if (options == null) {
				continue;
			}
			//选择题
			for(int i = 0; i < options.length; i++) {
				Long questionId = question.getId();
				boolean checked = checkAnswerOptions(answerList, questionId, i + 1);
				options[i].setChecked(checked);
			}
		}
		
		return visit;
	}

	/**
	 * 设置开放性问题答案
	 * @param question
	 * @param answerList
	 */
	private void setOpenAnswer(Question question, List<Answer> answerList) {
		for(Answer answer : answerList) {
			if (answer.getQuestionId() == question.getId()) {
				String answerStr = answer.getAnswer();
				if(!StringUtils.isBlank(answerStr)) {
					question.setQuestionOptions(answerStr);
				}
			}
		}
		
	}


	/**
	 * 处理选择题答案：查找此选项是否在答案中。选择题的答案是用逗号隔开的数字，
	 * @param answerList
	 * @param questionId
	 * @param position 答案位置， 第一个option为1， 第二个为2...
	 * @return
	 */
	private boolean checkAnswerOptions(List<Answer> answerList,	Long questionId, int position) {
		for(Answer answer : answerList) {
			if (answer.getQuestionId() == questionId) {
				String answerStr = answer.getAnswer();
				if(!StringUtils.isBlank(answerStr)) {
					String[] answerArray = answerStr.split(",");
					if (Arrays.binarySearch(answerArray, position + "") >= 0) {
						return true;
					}
				}
			}
		}
		
		return false;
	}
	
	/**
	 * 更新回访记录
	 */
	public void updateVisit(VisitFormBean visitFormBean){
		logger.info("修改现有访问记录");
		Customer customer = visitFormBean.getCustomer();
		customer.setId(visitFormBean.getCustomerId());
		visitMybatisDao.updateCustomer(customer);
		
		Case thisCase = new Case();
		thisCase.setBusinessType(visitFormBean.getBusinessType());
		thisCase.setEventTime(visitFormBean.getEventTime());
		thisCase.setGuestNum(visitFormBean.getGuestNum());
		thisCase.setSpaceTip(visitFormBean.getSpaceTip());
		thisCase.setTitle(visitFormBean.getCaseTitle());
		thisCase.setId(visitFormBean.getCaseId());
		visitMybatisDao.updateCase(thisCase);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("visitType", visitFormBean.getVisitType().getId());
		map.put("visitNum", visitFormBean.getVisitNum());
		map.put("visitTime", visitFormBean.getVisitTime());
		map.put("businessType", visitFormBean.getBusinessType().getId());
		map.put("isVisited", visitFormBean.getIsVisited());
		map.put("comment", visitFormBean.getComment());
		map.put("operator",visitFormBean.getOperator().getId());
		map.put("visitId", visitFormBean.getVisitId());
		visitMybatisDao.updateVisit(map);
		
		//update调查问卷答案
		if (visitFormBean.getPaper() != null && visitFormBean.getPaper().getQuestions() != null) {
			Map visitParameters = new HashMap<String, Object>();
			visitParameters.put("visitId", visitFormBean.getVisitId());
			visitParameters.put("paperId", visitFormBean.getPaper().getId());
			this.visitMybatisDao.deleteVisitAnswers(visitParameters);
			
			for(Question question : visitFormBean.getPaper().getQuestions()) {
				Map questionParameters = new HashMap<String, Object>();
				questionParameters.put("visitId", visitFormBean.getVisitId());
				questionParameters.put("paperId", visitFormBean.getPaper().getId());
				questionParameters.put("question", question);
				this.visitMybatisDao.updateVisitAnswers(questionParameters);
			}
		}
	}
}
