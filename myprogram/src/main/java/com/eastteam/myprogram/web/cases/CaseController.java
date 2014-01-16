package com.eastteam.myprogram.web.cases;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.service.cases.CaseService;
import com.eastteam.myprogram.web.Servlets;

@Controller
@RequestMapping(value = "/case")
public class CaseController {
	
	private static Logger logger = LoggerFactory.getLogger(CaseController.class);
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	@Autowired
	private CaseService caseService;
	
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String dispalyDetail(@PathVariable("id") Long id, Model model) {
		logger.info("caseid = " + id);
		Case mycase =  this.caseService.getCaseWithAnswer(id);
		logger.info("case = " + mycase);
		logger.info("case.paper.questions = " + mycase.getPaper().getQuestions());
		logger.info("case.businessType = " + mycase.getBusinessType().getId());
		model.addAttribute("mycase", mycase);
		return "case/detail";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "case_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in case controller");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Case> cases = caseService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		model.addAttribute("cases", cases);
		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
//		model.addAttribute("searchParams", searchParams);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "case/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Case> search(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "case_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Case> cases = caseService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		return cases;
	}


}
