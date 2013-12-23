package com.eastteam.myprogram.web.space;

import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.service.space.SpaceService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {
	@Autowired
	private SpaceService spaceService;
	private static Logger logger = LoggerFactory
			.getLogger(SpaceController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "space_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Spaces> spaces = spaceService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		model.addAttribute("spaces", spaces);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", searchParams);
		logger.info("searchParams=" + searchParams);
		return "space/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Spaces> search(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "space_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Spaces> spaces = spaceService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		return spaces;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "space/addSpace";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute Spaces space, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logger.info("in space save action");
		this.spaceService.save(space);
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		return "redirect:/space/list/";
	}
}
