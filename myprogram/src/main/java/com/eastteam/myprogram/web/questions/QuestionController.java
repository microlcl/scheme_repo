package com.eastteam.myprogram.web.questions;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.service.questions.QuestionService;
import com.eastteam.myprogram.web.Servlets;

@Controller
@RequestMapping (value = "/question")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	private static Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@RequestMapping (value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "question_id") String sortType,
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Question> questions = questionService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("question.pagesize")), sortType);
		List<Question> allQuestions = questions.getContent();
		Iterator<Question> it = allQuestions.iterator();
		while(it.hasNext()){
			Question question = it.next();
			String[] questionOptions = questionService.splitQuestionOptions(question.getQuestionOptions());
			question.setSplitOptions(questionOptions);
		}
		
		
//		String[] questionOptions = questionService.splitQuestionOptions(questions.)
		model.addAttribute("questions", questions);
		model.addAttribute("sortType", sortType);
		model.addAttribute("pageNumber", pageNumber);
//		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", searchParams);
		logger.info("searchParams=" + searchParams);
		return "question/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Question> search(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "question_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info("in ajax response:" + searchParams.toString());		
		Page<Question> questions = questionService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("question.pagesize")), sortType);
		List<Question> allQuestions = questions.getContent();
		Iterator<Question> it = allQuestions.iterator();
		while(it.hasNext()){
			Question question = it.next();
			String[] questionOptions = questionService.splitQuestionOptions(question.getQuestionOptions());
			question.setSplitOptions(questionOptions);
		}
		
		return questions;
	}
}
