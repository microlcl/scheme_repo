package com.eastteam.myprogram.web.cases;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/case")
public class CaseController {
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
//	@Autowired
//	private CaseMybatisDao caseDao;
	
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String dispalyDetail(@PathVariable("id") String id, Model model) {
//		Case mycase =  this.caseDao.get(id);

//		model.addAttribute("mycase", mycase);
		return "case/detail";
	}


}
