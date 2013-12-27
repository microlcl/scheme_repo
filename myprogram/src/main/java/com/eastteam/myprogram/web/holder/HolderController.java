package com.eastteam.myprogram.web.holder;

import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.service.holder.HolderService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/holder")
public class HolderController {
	@Autowired
	private HolderService holderService;
	private static Logger logger = LoggerFactory
			.getLogger(HolderController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("space_name", "会场名称");
		sortTypes.put("holder_name", "场地名称");
		sortTypes.put("volume", "容纳人数");
		sortTypes.put("level", "星级");
	}
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
		Page<Spaces> spaces = holderService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		model.addAttribute("spaces", spaces);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", searchParams);
		logger.info("searchParams=" + searchParams);
		return "holder/list";
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
		Page<Spaces> spaces = holderService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		return spaces;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "holder/addHolder";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute Holders holders, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logger.info("in holder save action");
		this.holderService.save(holders);
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		return "redirect:/holder/list/";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@RequestParam(value="id") int id,Model model, HttpServletRequest request) {
		Holders holder = this.holderService.getHolder(id);
		model.addAttribute("holder", holder);
		return "holder/updateHolder";
	}
	
	@RequestMapping(value = "doUpdate", method = RequestMethod.POST)
	public String doUpdate(@ModelAttribute Holders holders, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logger.info("in holder save action");
		this.holderService.doUpdate(holders);
		redirectAttributes.addFlashAttribute("message", "修改成功！");
		return "redirect:/holder/list/";
	}
	
	@RequestMapping(value = "show/holderInfo/{id}", method = RequestMethod.GET)
	public String dispalySpaceInfo(@PathVariable("id") long id, Model model) {
		Spaces space =  this.holderService.getSpace(id);

		model.addAttribute("infoSpace", space);
		return "holder/holderInfo";
	}
}
