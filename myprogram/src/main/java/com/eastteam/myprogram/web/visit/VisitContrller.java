/**
 * 
 */
package com.eastteam.myprogram.web.visit;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Category;
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
			@RequestParam(value = "sortType", defaultValue = "visit_stime") String sortType,
			Model model, ServletRequest request) {
		logger.info("in vist controller: list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info("是否初次到访 " + request.getParameter("isVisited"));
		if ((request.getParameter("isVisited") != "") && (request.getParameter("isVisited") != null)) {
			searchParams.put("isVisited", request.getParameter("isVisited"));
		}
		if ((request.getParameter("search_categoryId1") != "") && (request.getParameter("search_categoryId1") != null)) {
			searchParams.put("businessType", request.getParameter("search_categoryId1"));
		}
		if ((request.getParameter("dateFrom") != "") && (request.getParameter("dateFrom") != null)) {
			searchParams.put("dateFrom", request.getParameter("dateFrom"));
		}
		if ((request.getParameter("dateTo") != "") && (request.getParameter("dateTo") != null)) {
			searchParams.put("dateTo", request.getParameter("dateTo"));
		}
		Page<VisitActivity> visits = visitService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("visitActivity.pagesize")), sortType);
		List<VisitActivity> visitList = visits.getContent();
		model.addAttribute("visits", visits);
		model.addAttribute("sortType", sortType);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("sortTypes", sortType);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		
		Object businessType = searchParams.get("categoryId1");
		model.addAttribute("businessType", businessType);
		Object isVisited = searchParams.get("isVisited");
		model.addAttribute("isVisited", isVisited);
		Object dateFrom = searchParams.get("dateFrom");
		model.addAttribute("dateFrom", dateFrom);
		Object dateTo = searchParams.get("dateTo");
		model.addAttribute("dateTo", dateTo);
		

		return "visit/list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model, ServletRequest request) {
		logger.info("in visit controller: add");
		
		return "visit/addVisit";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(HttpSession session, VisitFormBean visitFormBean, @RequestParam(value="customerVisitTime") String visitTime, 
			@RequestParam(value="customerEventTime") String eventTime, @RequestParam(value="visitNumber") String visitNumber, 
			@RequestParam(value="guestNumber") String guestNumber, @RequestParam(value="visitTypeId") String visitTypeId,
			@RequestParam(value="businessTypeId") String businessTypeId) {
		logger.info("in visit save");
		
		visitFormBean.setVisitTime(visitTime);
		visitFormBean.setEventTime(eventTime);
		visitFormBean.setVisitNum(Integer.parseInt(visitNumber));
		visitFormBean.setGuestNum(Integer.parseInt(guestNumber));
		Category visitType = new Category();
		visitType.setId(visitTypeId);
		Category businessType = new Category();
		businessType.setId(businessTypeId);
		visitFormBean.setBusinessType(businessType);
		visitFormBean.setVisitType(visitType);
		logger.info("VisitFormBean: " + visitFormBean.toString());
		
		visitService.saveVisit(visitFormBean);
		
		return "redirect:/visit/list";
	}
}
