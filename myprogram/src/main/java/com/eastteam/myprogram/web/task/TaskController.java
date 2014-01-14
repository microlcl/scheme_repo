package com.eastteam.myprogram.web.task;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.CategoryLiteBean;
import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Task;
import com.eastteam.myprogram.service.task.TaskService;
import com.eastteam.myprogram.web.Servlets;
import com.eastteam.myprogram.web.WebUtils;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/task")
public class TaskController {
	@Autowired
	private TaskService taskService;
	
	private static Logger logger = LoggerFactory
			.getLogger(TaskController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("task_type", "作业类型");
		sortTypes.put("owner", "作业拥有者");
		sortTypes.put("priority", "作业优先级");
	}
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
		Page<Task> tasks = taskService.getCurrentPageContent(
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
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute Task task,@RequestParam(value="finishTime") String finishTime, Model model,RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logger.info("in holder save action");
		if(finishTime!=null&&!finishTime.equals("")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dueDate = new Date();
			try {
				dueDate = sdf.parse(finishTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			task.setDueDate(dueDate);
		}
		task.setCreatedTimestamp(new Date());
		this.taskService.save(task);
			
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		return "redirect:/task/list/";
	}
	@RequestMapping(value="upload",method = RequestMethod.GET)
	public String showUplaodPage() {
		logger.info("in upload page");
		return "task/upload";
	}
	
	/**
	 * 使用plupload上传文件
	 * @param file		文件对象
	 * @param name		文件名称
	 * @param chunk		数据块序号
	 * @param chunks	数据块总数
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="upload",method=RequestMethod.POST)	
	public void plupload(@RequestParam MultipartFile file, HttpSession session, String name) {
		String relativePath = "/plupload/files/attachment";
		String realPath = WebUtils.getRealPath(session);
		String mediafolder = realPath + relativePath;
//		加上sessionId作为上传文件名
		String filename = session.getId() + "_" + name;
		logger.info("文件保存路径：" + mediafolder);
		logger.info("文件名称：" + filename);		
//		taskService.saveFile(file, realPath, filename);
		
//		return "";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@RequestParam(value="id") String id,Model model, HttpServletRequest request) {
		Task task = this.taskService.getTask(id);
		model.addAttribute("task", task);
		return "task/updateTask";
	}
}
