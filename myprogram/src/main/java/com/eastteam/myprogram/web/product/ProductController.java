package com.eastteam.myprogram.web.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jetty.server.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.Module;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Product_category;
import com.eastteam.myprogram.entity.Role;
import com.eastteam.myprogram.service.product.ProductService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private ProductService productService;

	private static Logger logger = LoggerFactory
			.getLogger(ProductController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("product_id", "id");
		sortTypes.put("title", "产品名");
	}
	private static final int PAGE_SIZE = 5;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "product_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Product> products = productService.getCurrentPageContent(
				searchParams, pageNumber, PAGE_SIZE, sortType);
		model.addAttribute("products", products);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets
				.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "product/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Product> search(
			@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "product_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		logger.info(searchParams.toString());
		Page<Product> products = productService.getCurrentPageContent(
				searchParams, pageNumber, PAGE_SIZE, sortType);
		return products;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "product/addProduct";
	}

	@RequestMapping(value = "doAdd", method = RequestMethod.POST)
	public String doAdd(@ModelAttribute Product product, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		logger.info("in role update action");
//		String row_count = request.getParameter("row_count");
		List<Product_category> list = new ArrayList<Product_category>();
		String[] pictures = request.getParameterValues("picture");
		String[] searchCategoryIds = request.getParameterValues("searchCategoryId");
		for (int i = 0; i < searchCategoryIds.length; i++) {
			if(pictures[i]!=null&&!pictures[i].equals("")&&searchCategoryIds[i]!=null&&!searchCategoryIds[i].equals("")){
				Long picture = Long.parseLong(pictures[i]);
				String searchCategoryId = searchCategoryIds[i];
				Product_category product_category= new Product_category();
				product_category.setPicture_id(picture);
				product_category.setCategory_id(searchCategoryId);
				list.add(product_category);
			}
		}
		this.productService.doAdd(product,list);
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		
		return "redirect:/product/list/";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@ModelAttribute Product productTemp,Model model, HttpServletRequest request) {
		String[] ids = request.getParameterValues("productId");
		if (ids[0] != null && !ids[0].equals("")) {
			Product product = this.productService.getProductList(Long.parseLong(ids[0]));
			model.addAttribute("product", product);
		}
		return "product/detailProduct";
	}

	@RequestMapping(value="saveUpdate",method = RequestMethod.POST)
	public String saveUpdate (@ModelAttribute Product product, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		return "redirect:/product/list/";
	}
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(@ModelAttribute Product productTemp, Model model,
			HttpServletRequest request) {
		String[] ids = request.getParameterValues("productId");
		Product product=new Product();
		if (ids[0] != null && !ids[0].equals("")) {
			product = this.productService.getProductList(Long.parseLong(ids[0]));
		}
		model.addAttribute("product", product);
		return "product/detailProduct";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest request) {
		String[] ids = request.getParameterValues("productId");
		if (ids.length > 0) {
			for (int i =0; i < ids.length; i++) {
				Long id = Long.parseLong(ids[i]);
				this.productService.delete(id);
			}
		}
		return "redirect:/product/list/";
	}
}
