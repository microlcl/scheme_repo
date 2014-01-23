package com.eastteam.myprogram.service.cases;

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

import com.eastteam.myprogram.dao.CaseMybatisDao;
import com.eastteam.myprogram.dao.VisitMybatisDao;
import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Option;
import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.entity.VisitActivity;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class CaseService extends PageableService {
	
	private static Logger logger = LoggerFactory.getLogger(CaseService.class);
	
	@Autowired
	private CaseMybatisDao caseDao;
	
	@Autowired
	private VisitMybatisDao visitDao;
	
	
	public List<Case> search(Map parameters, Pageable pageRequest) {
		// TODO
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return caseDao.search(param);
	}

	
	public Long getCount(Map parameters) {
		// TODO
		return caseDao.getCount(parameters);
	}
	
	public Case get(Long caseId) {
		Case myCase = this.caseDao.get(caseId);
		// Build visitActivity List for this Case
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("caseId", caseId);
		parameters.put("sort", "visit_stime");		
		List<VisitActivity> visitActivities = this.visitDao.search(parameters);
		myCase.setVisitActivities(visitActivities);
		return myCase;
	}
	
	public List<Answer> getAnswers(Long caseId) {
		return this.caseDao.getAnswers(caseId);
	}
	
	public Case getCaseWithAnswer(Long caseId) {
		Case mycase = this.get(caseId);
		mycase.setStatkeholders(this.caseDao.getStakeholders(caseId));
		if (mycase.getPaper() != null) {
			List<Answer> answerList = this.getAnswers(caseId);		
			return buildCaseWithAnswers(mycase, answerList);
		}
		
		return mycase;
	}

	private Case buildCaseWithAnswers(Case mycase, List<Answer> answerList) {
		List<Question> questionList = mycase.getPaper().getQuestions();
		if (questionList == null || questionList.isEmpty() || answerList == null || answerList.isEmpty()) {
			return mycase;
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
		return mycase;
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
	
	public void update(Case mycase) {
		this.caseDao.update(mycase);
		this.caseDao.deleteAnswers(mycase);
		if (mycase.getPaper() != null && mycase.getPaper().getQuestions() != null) {
			for(Question question : mycase.getPaper().getQuestions()) {
				Map parameters = new HashMap<String, Object>();
				parameters.put("caseId", mycase.getId());
				parameters.put("paperId", mycase.getPaper().getId());
				parameters.put("question", question);
				logger.info("--------------------");
				logger.info("caseid=" + mycase.getId());
				logger.info("paperId=" + mycase.getPaper().getId());
				logger.info("questionid=" + question.getId());
				logger.info("answer=" + question.getQuestionOptions());
				this.caseDao.insertAnswers(parameters);
			}
		}
	}
	
	public List<Category> getDefaultCharacters(Category businessType) {
		return this.caseDao.getDefaultCharacters(businessType);
	}

}
