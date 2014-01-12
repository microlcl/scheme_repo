/**
 * 
 */
package com.eastteam.myprogram.web.visit;

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

import com.eastteam.myprogram.entity.Question;
import com.eastteam.myprogram.entity.VisitActivity;
import com.eastteam.myprogram.service.visit.VisitService;
import com.eastteam.myprogram.web.Servlets;

/**
 * @author LSS
 *
 */

@Controller
@RequestMapping(value = "/visit")
public class VisitContrller {
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	@Autowired
	private VisitService visitService;
	
	private static Logger logger = LoggerFactory.getLogger(VisitContrller.class);
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "visit_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		Page<VisitActivity> visits = visitService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("visitActivity.pagesize")), sortType);
		List<VisitActivity> visitList = visits.getContent();
		model.addAttribute("visits", visits);
		model.addAttribute("sortType", sortType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("sortTypes", sortType);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		

		return "visit/list";
	}

}
