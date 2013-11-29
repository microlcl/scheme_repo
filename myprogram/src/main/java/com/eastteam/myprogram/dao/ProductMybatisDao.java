package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.Product;
import com.eastteam.myprogram.entity.Product_categoryid;

@MyBatisRepository
public interface ProductMybatisDao {
	public List<Product> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	public void save(Product product);
	public void saveProduct_categoryid(Product_categoryid product_categoryid);
	public void saveMedia(Media media);
	public void update(Product product);
	public void updateProduct_categoryid(Product_categoryid product_categoryid);
	public void updateMedia(Media media);
	public void delete(Product product);
	public void deleteProduct_categoryid(Product_categoryid product_categoryid);
	public void deleteMedia(Media media);
	public Product getProduct(String product_id,String category_id);
}
