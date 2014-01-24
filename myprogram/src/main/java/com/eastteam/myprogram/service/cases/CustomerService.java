package com.eastteam.myprogram.service.cases;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.CustomerMybatisDao;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.service.PageableService;

@Component
@Transactional
public class CustomerService extends PageableService {
	
	private static Logger logger = LoggerFactory.getLogger(CustomerService.class);
	
	@Autowired
	private CustomerMybatisDao customerDao;

	
	
	public List<Case> search(Map parameters, Pageable pageRequest) {
		// TODO
		return null;
	}

	
	public Long getCount(Map parameters) {
		// TODO
		return 0L;
	}
	
	public void update(Customer customer) {
		this.customerDao.update(customer);
	}

}
