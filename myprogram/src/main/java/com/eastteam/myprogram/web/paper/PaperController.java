/**
 * 
 */
package com.eastteam.myprogram.web.paper;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;

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
		logger.info(searchParams.toString());
		Page<Paper> papers = paperService.getCurrentPageContent(searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("question.pagesize")), sortType);
		model.addAttribute("papers", papers);
		model.addAttribute("sortType", sortType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("searchParams", searchParams);
		logger.info("searchParams=" + searchParams);
		return "paper/list";
	}
	
	@RequestMapping(value = "show/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") String id, Model model) {
		List<Question> questions = this.paperService.getQuestions(id);
		model.addAttribute("questions", questions);
		return "/paper/paperDetail";
	}
}
