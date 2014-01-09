package com.eastteam.myprogram.web.task;

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

import com.eastteam.myprogram.entity.CategoryLiteBean;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.Task;
import com.eastteam.myprogram.service.category.CategoryService;
import com.eastteam.myprogram.service.holder.HolderService;
import com.eastteam.myprogram.service.task.TaskService;
import com.eastteam.myprogram.web.Servlets;
import com.eastteam.myprogram.web.holder.HolderController;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/task")
public class TaskController {
	@Autowired
	private TaskService taskService;
	
	private static Logger logger = LoggerFactory
			.getLogger(TaskController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "task_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Spaces> tasks = taskService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		model.addAttribute("tasks", tasks);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
//		model.addAttribute("searchParams", searchParams);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "task/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Task> search(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "task_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Task> tasks = taskService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		return tasks;
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "task/addTask";
	}

}
