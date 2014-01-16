/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.VisitActivity;

/**
 * @author LSS
 *
 */

@MyBatisRepository
public interface VisitMybatisDao {
	
	public List<VisitActivity> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	public void insertCustomer(String customerName);
	public void insertVisit(Map<String, Object> parameters);
	

}
