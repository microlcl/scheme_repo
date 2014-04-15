package com.eastteam.myprogram.web.procedure;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Category;
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
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "procedure/addProcedure";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(Model model, Procedure procedureBean,RedirectAttributes redirectAttributes,HttpServletRequest request){
		logger.info("in procedure Controller save procedure");
		Procedure procedure = procedureBean;
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Category businessType = new Category();
		businessType.setId(searchParams.get("categoryId").toString());
		procedure.setBusinessType(businessType);
		this.procedureService.saveProcedure(procedure);
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		return "redirect:/procedure/list/";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") String id, Model model) {
		Procedure procedure = this.procedureService.selectProcedure(id);
		model.addAttribute("procedures", procedure);
		return "/procedure/updateProcedure";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Model model, Procedure procedureBean,RedirectAttributes redirectAttributes, HttpServletRequest request){
		logger.info("=====in procedure Controller update procedure");
		Procedure procedure = procedureBean;
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Category businessType = new Category();
		businessType.setId(searchParams.get("categoryId").toString());
		procedureBean.setBusinessType(businessType);
		this.procedureService.updateProcedure(procedure);
		redirectAttributes.addFlashAttribute("message", "修改成功！");
		return "redirect:/procedure/list/";		
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") String id, Model model,RedirectAttributes redirectAttributes) {
		this.procedureService.deleteProcedure(id);
		redirectAttributes.addFlashAttribute("message", "删除成功！");
		return "redirect:/procedure/list/";
	}
}
