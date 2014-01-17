/**
 * 
 */
package com.eastteam.myprogram.service.visit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.VisitMybatisDao;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.entity.VisitActivity;
import com.eastteam.myprogram.service.PageableService;
import com.eastteam.myprogram.web.visit.VisitFormBean;
import com.google.common.collect.Maps;

/**
 * @author LSS
 *
 */

@Component
@Transactional
public class VisitService extends PageableService {
	
	@Autowired
	private VisitMybatisDao visitMybatisDao;
	
	private static Logger logger = LoggerFactory.getLogger(VisitService.class);
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		logger.info("in visit activity service : search ");
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		List<VisitActivity> visitList = visitMybatisDao.search(param);
		
		return visitList;
	}
	
	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		Map param = Maps.newHashMap(parameters);
		return visitMybatisDao.getCount(param);
	}
	
	public void saveVisit(VisitFormBean visitFormBean) {
		logger.info("in visit activity service : save visit");
		Customer customer = new Customer();
		customer.setCustomerName(visitFormBean.getCustomerName());
		Case thisCase = new Case();
		thisCase.setBusinessType(visitFormBean.getBusinessType());
		thisCase.setEventTime(visitFormBean.getEventTime());
		thisCase.setGuestNum(visitFormBean.getGuestNum());
		thisCase.setSpaceTip(visitFormBean.getSpaceTip());
		thisCase.setTitle(visitFormBean.getCaseTitle());
		visitMybatisDao.insertCustomer(customer);
		visitMybatisDao.insertCase(thisCase);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("Case Id:" + thisCase.getId() + " Customer Id" + customer.getId());
		map.put("customerId", customer.getId());
		map.put("visitType", visitFormBean.getVisitType().getId());
		map.put("visitTime", visitFormBean.getVisitTime());
		map.put("businessType", visitFormBean.getBusinessType().getId());
		map.put("caseId", thisCase.getId());
		map.put("isVisited", visitFormBean.getIsVisited());
		map.put("comment", visitFormBean.getComment());
		visitMybatisDao.insertVisit(map);
	}

}
