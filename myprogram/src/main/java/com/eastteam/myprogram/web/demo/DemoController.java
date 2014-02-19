package com.eastteam.myprogram.web.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/demo")
public class DemoController {

	
	private static Logger logger = LoggerFactory.getLogger(DemoController.class);
	
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String save() {

		return "demo/list";
	}
	
	@RequestMapping(value="test",method = RequestMethod.GET)
	public String test() {

		return "demo/test";
	}
	
	@RequestMapping(value="popupwindow",method = RequestMethod.GET)
	public String showPopupwindow() {

		return "demo/popupwindow";
	}
	
	@RequestMapping(value="accountSelector",method = RequestMethod.GET)
	public String showAccountSelector() {
		logger.info("showAccountSelector");
		return "demo/accountSelector";
	}
	
	@RequestMapping(value="caseSelector",method = RequestMethod.GET)
	public String showCaseSelector() {
		logger.info("showCaseSelector");
		return "demo/caseSelector";
	}
	
	@RequestMapping(value="spaceSelector",method = RequestMethod.GET)
	public String showSpaceSelector() {
		logger.info("showSpaceSelector");
		return "demo/spaceSelector";
	}
}
