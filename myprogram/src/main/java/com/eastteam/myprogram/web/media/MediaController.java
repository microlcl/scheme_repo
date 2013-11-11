package com.eastteam.myprogram.web.media;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eastteam.myprogram.web.Servlets;

@Controller
@RequestMapping(value = "/media")
public class MediaController {
	
	private static final int PAGE_SIZE = 5;
	
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
//		Page<User> users = accountService.getCurrentPageContent(searchParams, pageNumber, PAGE_SIZE, sortType);
		model.addAttribute("medias", "medias");
		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "media/list";
	}

	
	@RequestMapping(value="add",method = RequestMethod.GET)
	public String add() {
		logger.info("in add");
		return "media/add";
	}
}
