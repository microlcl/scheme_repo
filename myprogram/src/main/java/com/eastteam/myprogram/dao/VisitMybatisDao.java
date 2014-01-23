/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.entity.VisitActivity;

/**
 * @author LSS
 *
 */

@MyBatisRepository
public interface VisitMybatisDao {
	
	public List<VisitActivity> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);
	public void insertCustomer(Customer customer);
	public void insertCase(Case thisCase);
	public void insertVisit(Map<String, Object> parameters);
	public List<Customer> selectCustomers();
	public VisitActivity selectVisit(Long visitId);
	public void updateCustomer(Customer customer);
	public void updateCase(Case thisCase);
	public void updateVisit(Map<String, Object> parameters);
	

}
