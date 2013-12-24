package com.eastteam.myprogram.web.questions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping (value = "/question")
public class QuestionController {
	private static Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@RequestMapping (value = "list", method = RequestMethod.GET)
	public String list(){
		return "question/list";
	}
}
