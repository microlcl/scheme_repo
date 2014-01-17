package com.eastteam.myprogram.service.cases;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.CaseMybatisDao;
import com.eastteam.myprogram.entity.Answer;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Option;
import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class CaseService extends PageableService {
	
	@Autowired
	private CaseMybatisDao CaseDao;
	
	
	public List<Case> search(Map parameters, Pageable pageRequest) {
		// TODO
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return CaseDao.search(param);
	}

	
	public Long getCount(Map parameters) {
		// TODO
		return CaseDao.getCount(parameters);
	}
	
	public Case get(Long caseId) {
		return this.CaseDao.get(caseId);
	}
	
	public List<Answer> getAnswers(Long caseId) {
		return this.CaseDao.getAnswers(caseId);
	}
	
	public Case getCaseWithAnswer(Long caseId) {
		Case mycase = this.get(caseId);
		List<Answer> answerList = this.getAnswers(caseId);		
		return buildCaseWithAnswers(mycase, answerList);
	}

	private Case buildCaseWithAnswers(Case mycase, List<Answer> answerList) {
		List<Question> questionList = mycase.getPaper().getQuestions();
		if (questionList == null || questionList.isEmpty() || answerList == null || answerList.isEmpty()) {
			return mycase;
		}
		for (Question question : questionList) {
			Option[] options = question.getOptions();
			if (options == null) {
				continue;
			}
			
			for(int i = 0; i < options.length; i++) {
				Long questionId = question.getId();
				boolean checked = checkAnswerOptions(answerList, questionId, i + 1);
				options[i].setChecked(checked);
			}
		}
		return mycase;
	}

	/**
	 * 查找此选项是否在答案中。选择题的答案是用逗号隔开的数字，
	 * @param answerList
	 * @param questionId
	 * @param position 答案位置， 第一个option为1， 第二个为2...
	 * @return
	 */
	private boolean checkAnswerOptions(List<Answer> answerList,	Long questionId, int position) {
		for(Answer answer : answerList) {
			if (answer.getQuestionId() == questionId) {
				String answerStr = answer.getAnswer();
				String[] answerArray = answerStr.split(",");
				if (Arrays.binarySearch(answerArray, position + "") >= 0) {
					return true;
				}
			}
		}
		
		return false;
	}
	
	public void update(Case mycase) {
		this.CaseDao.update(mycase);
	}	

}
