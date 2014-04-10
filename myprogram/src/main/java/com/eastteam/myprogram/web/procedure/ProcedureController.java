package com.eastteam.myprogram.web.procedure;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eastteam.myprogram.entity.Procedure;
import com.eastteam.myprogram.service.procedure.ProcedureService;
import com.eastteam.myprogram.web.Servlets;


@Controller
@RequestMapping(value = "/procedure")
public class ProcedureController {
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	@Autowired
	private ProcedureService procedureService;
	
	private static Logger logger = LoggerFactory.getLogger(ProcedureController.class);
	
	@RequestMapping (value="list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page", defaultValue="1") int pageNumber,
			@RequestParam(value="sortType", defaultValue="procedure_id") String sortType,
			Model model, ServletRequest request){
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");

		logger.info(searchParams.toString());
		Page<Procedure> procedures = procedureService.getCurrentPageContent(
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("list.pagesize")), sortType);
		model.addAttribute("procedures", procedures);
		model.addAttribute("sortType", sortType);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);	
		
		
		return "procedure/list";
	}
}
