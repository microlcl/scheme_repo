package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Product_category;

@MyBatisRepository
public interface ProductMybatisDao {
	public List<Product> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	public void save(Product product);
	public void saveProduct_category(Product_category product_category);
	public void saveMedia(Media media);
	public void update(Product product);
	public void updateProduct_category(Product_category product_category);
	public void updateMedia(Media media);
	public void delete(Product product);
	public void deleteProduct_category(Long  product_id);
	public void deleteMedia(Media media);
	public Product getProduct(Long product_id);
	public List<Product_category> getProduct_category(Long product_id);
	public Category getCategory(String id);
	public Media getMedia(Long media_id);
}
