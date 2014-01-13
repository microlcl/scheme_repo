package com.eastteam.myprogram.web.cases;

import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.service.cases.CaseService;

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
		Case mycase =  this.caseService.get(id);
		logger.info("case = " + mycase);
		logger.info("case.businessType = " + mycase.getBusinessType().getId());
		model.addAttribute("mycase", mycase);
		return "case/detail";
	}


}
