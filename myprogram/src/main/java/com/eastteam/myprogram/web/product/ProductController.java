package com.eastteam.myprogram.web.product;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.ProductCategory;
import com.eastteam.myprogram.service.category.CategoryService;
import com.eastteam.myprogram.service.product.ProductService;
import com.eastteam.myprogram.web.Servlets;
import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	private static Logger logger = LoggerFactory
			.getLogger(ProductController.class);
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("product_id", "id");
		sortTypes.put("title", "产品名");
	}

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
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		model.addAttribute("products", products);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", searchParams);
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
				searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		return products;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		return "product/addProduct";
	}

	@RequestMapping(value = "doAdd", method = RequestMethod.POST)
	public String doAdd(@ModelAttribute Product product, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logger.info("in product update action");
//		String row_count = request.getParameter("row_count");
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		String[] pictures = request.getParameterValues("picture");
		String[] medias = request.getParameterValues("default_picture_id");
		Long media_id = Long.parseLong(medias[0]);
		Media media = this.productService.getMedia(media_id);
		product.setMedia(media);
		logger.info("=====Product media path: " + media.getPath());
		String[] searchCategoryIds = request.getParameterValues("searchCategoryId");
		for (int i = 0; i < searchCategoryIds.length; i++) {
			if(pictures[i]!=null&&!pictures[i].equals("")&&searchCategoryIds[i]!=null&&!searchCategoryIds[i].equals("")){
				Long picture = Long.parseLong(pictures[i]);
				String searchCategoryId = searchCategoryIds[i];
				ProductCategory productCategory= new ProductCategory();
				productCategory.setPicture_id(picture);
				productCategory.setCategory_id(searchCategoryId);
				list.add(productCategory);
			}
		}
		this.productService.doAdd(product,list);
		redirectAttributes.addFlashAttribute("message", "增加成功！");
		
		return "redirect:/product/list/";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@RequestParam(value="productId") String productId,Model model, HttpServletRequest request) {
//		String[] ids = request.getParameterValues("productId");
		//String id = request.getParameter("productId");
		Product product = this.productService.getProductList(Long.parseLong(productId));
		model.addAttribute("product", product);
		logger.info("" +product.getCategorys());
		return "product/editProduct";
	}

	@RequestMapping(value="updateProduct",method = RequestMethod.POST)
	public String saveUpdate (@ModelAttribute Product product, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		logger.info("in product update action");
//		String row_count = request.getParameter("row_count");
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		String[] pictures = request.getParameterValues("picture");
		String[] searchCategoryIds = request.getParameterValues("searchCategoryId");
		for (int i = 0; i < searchCategoryIds.length; i++) {
			if(pictures[i]!=null&&!pictures[i].equals("")&&searchCategoryIds[i]!=null&&!searchCategoryIds[i].equals("")){
				Long picture = Long.parseLong(pictures[i]);
				String searchCategoryId = searchCategoryIds[i];
				ProductCategory productCategory= new ProductCategory();
				productCategory.setPicture_id(picture);
				productCategory.setCategory_id(searchCategoryId);
				list.add(productCategory);
			}
		}
		this.productService.saveUpdate(product,list);
		redirectAttributes.addFlashAttribute("message", "修改成功！");
		
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
		model.addAttribute("categorys", this.categoryService.getFuntionCategorys("M1-5"));
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
