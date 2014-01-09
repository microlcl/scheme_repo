/**
 * 
 */
package com.eastteam.myprogram.web.paper;

import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.service.paper.PaperService;
import com.eastteam.myprogram.web.Servlets;

/**
 * @author LSS
 *
 */
@Controller
@RequestMapping (value = "/paper")
public class PaperController {
	@Autowired
	private PaperService paperService;
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	private static Logger logger = LoggerFactory.getLogger(PaperService.class);
	
	@RequestMapping (value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "paper_id") String sortType,
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		Page<Paper> papers = paperService.getCurrentPageContent(searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("question.pagesize")), sortType);
		model.addAttribute("papers", papers);
		model.addAttribute("sortType", sortType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("in paper Controller: searchParams=" + searchParams);
		Object status = searchParams.get("categoryId1");
		model.addAttribute("status", status);
		Object businessType = searchParams.get("categoryId2");
		model.addAttribute("businessType", businessType);
		
		return "paper/list";
	}
	
	@RequestMapping(value = "show/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") String id, Model model) {
		List<Question> questions = this.paperService.getQuestions(id);
		Iterator<Question> it = questions.iterator();
		while(it.hasNext()){
			Question question = it.next();
			String[] questionOptions = this.paperService.splitQuestionOptions(question.getQuestionOptions());
			question.setSplitOptions(questionOptions);
		}
		model.addAttribute("questions", questions);
		return "/paper/paperDetail";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "paper/addPaper";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") String id, Model model) {
		//List<Question> questions = this.paperService.getQuestions(id);
		Paper paper = this.paperService.selectPaper(id);
		Iterator<Question> it = paper.getQuestions().iterator();
		while(it.hasNext()){
			Question question = it.next();
			String[] questionOptions = this.paperService.splitQuestionOptions(question.getQuestionOptions());
			question.setSplitOptions(questionOptions);
		}
		model.addAttribute("selectpaper", paper);
		return "/paper/updatePaper";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String id, Model model) {
		this.paperService.deletePaper(id);
		
		return "redirect:/paper/list/";
	}
	
	@RequestMapping(value = "publish/{id}", method = RequestMethod.GET)
	public String publish(@PathVariable("id") String id, Model model) {
		logger.info("in paper control publish");
		this.paperService.publishPaper(id);
		
		return "redirect:/paper/list/";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Model model, Paper paperBean, HttpServletRequest request){
		logger.info("=====in paper Controller update parper");
		Paper paper = paperBean;
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Category businessType = new Category();
		businessType.setId(searchParams.get("categoryId").toString());
		paper.setBusinessType(businessType);
		this.paperService.updatePaper(paper);
		
		return "redirect:/paper/list/";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(Model model, Paper paperBean, HttpServletRequest request){
		logger.info("in paper Controller save parper");
		Paper paper = paperBean;
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Category businessType = new Category();
		businessType.setId(searchParams.get("categoryId").toString());
		paper.setBusinessType(businessType);
		
		this.paperService.saveQuestions(paper);
		
		return "redirect:/paper/list/";
	}
	
}
