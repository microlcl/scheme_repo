package com.eastteam.myprogram.service.product;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.ProductMybatisDao;
import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Product_category;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

@Component
@Transactional
public class ProductService extends PageableService {
	@Autowired
	private ProductMybatisDao productMybatisDao;
	
	private int pageSize;
	
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		logger.info("in service, pagesize = " + pageSize);
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		List p= productMybatisDao.search(param);
		return productMybatisDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		Map param = Maps.newHashMap(parameters);
		return productMybatisDao.getCount(param);
	}
	
	public Product getProductList(Long id) {
		Product product = new Product();
		product = productMybatisDao.getProduct(id);
		List<Product_category> productCategorys = productMybatisDao
				.getProduct_category(product.getId());
		List<Category> categorys = new ArrayList<Category>();
		for (Product_category productCategory : productCategorys) {
			Category category = productMybatisDao.getCategory(productCategory
					.getCategory_id());
			Media media = productMybatisDao.getMedia(productCategory
					.getPicture_id());
			category.setMedia(media);
			categorys.add(category);
		}
		product.setCategorys(categorys);
		return product;
	}
	//删除Product，以及Product_category
	public void delete(Long productId){
		productMybatisDao.deleteProduct_category(productId);
		Product product=new Product();
		product.setId(productId);
		productMybatisDao.delete(product);
	}
	
	public void doAdd(Product product,List<Product_category> list){
		productMybatisDao.save(product);
		
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Product_category product_category = (Product_category) iterator
					.next();
			product_category.setProduct_id(product.getId());
			productMybatisDao.saveProduct_category(product_category);
		}
		
	}
	public void saveUpdate(Product product,List<Product_category> list){
		productMybatisDao.update(product);
		productMybatisDao.deleteProduct_category(product.getId());
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Product_category product_category = (Product_category) iterator
					.next();
			product_category.setProduct_id(product.getId());
			productMybatisDao.saveProduct_category(product_category);
		}
		
	}
	
	public Media getMedia(Long media_id){
			return (productMybatisDao.getMedia(media_id));
	}
}
